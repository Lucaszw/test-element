class GeneratorController < ApplicationController
  def form
   
    @model = UserModel.find(params[:modelid])
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end
    
  end
  def w_printform
  
    @errors = false
    
    # Grab the model :
    @model = UserModel.find(params[:modelid])
    
    # Check if logged in, and load the navigation bar dependingly
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end
    
    
    begin
      volumes = @model.calculated_volumes.delete("'").split(',').flatten.collect { |i| i.to_f }
    rescue # StandardError
      volumes = [0,0,0,0]
      @errors = true
    end

    # Convert volumes to cubic inches :
    volumes = volumes.collect { |i| i * 0.061} 
      
      
    # Split into high and low quality     
    @high_quality_volumes = volumes[0..1]
    @low_quality_volumes  = volumes[2..3]
            
    # Multiplyer to UW:
    begin
      low_quality_uw  = @low_quality_volumes.collect { |i| i * 1.21}
      high_quality_uw = @high_quality_volumes.collect { |i| i * 1.09}
      
      # Multiplyer for support material
      # Originally 19.8 % and 26.2%, modified for higher accuracy    
      low_quality_m1  = @low_quality_volumes.collect { |i| i * 0.23958}
      high_quality_m1 = @high_quality_volumes.collect { |i| i * 0.28558}
      
      # Total price = sum of original model volume and support material
      @low_quality_price  = low_quality_uw.zip(low_quality_m1).map { |x, y| (x + y)*9 }
      @high_quality_price = high_quality_uw.zip(high_quality_m1).map { |x, y| (x + y)*12.25 }    
    rescue
      @errors = true
    end 
                            
  end
  
  def send_stl
    @errors = "no"
    @model = params[:model]
    begin
      @currentUser = User.find(session[:id])
      StlSender.stl_attatchment_email(@currentUser, @model)
    rescue
      @errors = "some"
    end
    render :text => "Email was sent, there were #{@errors} errors"
  end
  
  def download
    params[:gcode]
  end

  def submit
  
  HardWorker.perform_async() 
  
  # get the url of the model being printed :
  model = UserModel.find(params[:generator][:modelid])
  params[:generator].delete :modelid

  `clear`

  # replace g-code unfriendly parameters with friendly ones :
  center_point = params[:generator][:center_of_print_x] +
   "," + params[:generator][:center_of_print_y]
  params[:generator].delete :center_of_print_x
  params[:generator].delete :center_of_print_y
  if (center_point != ",") 
    params[:generator][:print_center] = center_point
  end

  bed_size = params[:generator][:bed_size_x] + 
  "," + params[:generator][:bed_size_y]
  params[:generator].delete :bed_size_x
  params[:generator].delete :bed_size_y
  if (bed_size != ",") 
    params[:generator][:bed_size] = bed_size
  end
  
   
  
  # Get the in-fill density as it is not directly defined for some reason
  # In the g-code :
  
  filament_density  = "0.4"
  filament_diameter = ""
  #   Check if the user submited a fill density, if so change filement from default
  if (params[:generator][:fill_density] != nil && params[:generator][:fill_density] != "" && params[:generator][:fill_density].present?)
    filament_density = params[:generator][:fill_density]
  end
  
  stlLocation = "public" + model.stlfile.url
  # remove the random numbers from the end of the file name :
  salt_point = stlLocation.length - stlLocation.index('?')
  stlLocation = stlLocation[0..-1*salt_point-1]

  # also get the file name again without the extension , to get the name of the
  # gcode file that will be generated:
  exten_point = stlLocation.length - stlLocation.index('.')
  filename = stlLocation[0..-1*exten_point-1]
  @gcodefile = filename + ".gcode"

  gcode_string = ""
  
  params[:generator].each do |generator|

    # Check if the user actually submitted something, else don't add a flag
    if generator[1] != nil && generator[1] != "" && generator[1].present?
      # if from a checkbox , and the box is checked : 
      if generator[1] == "yes"
        gcode_string << "--" + generator[0].gsub("_","-") + " "
      elsif generator[1] != "no"
        # Else submit as a flag + a condition :
        gcode_string << "--" + generator[0].gsub("_","-") + " " + generator[1]+" "
      end
      # Print to console :
    end
  end

   

  didMakeGcode = "";
  command = Thread.new do
     didMakeGcode = system "sudo perl internal/Slic3r/slic3r.pl #{gcode_string + stlLocation}"
  end
# Make sure that the gcode is developed before continuing...
  command.join
  
   # Create readme for when errors occur (overwritten if file generated successfully)
   readme = "Please check your STL file..."  
   
# #    Get the filament_diameter from the gcode file
    if(didMakeGcode == true)
      f = File.open("#{@gcodefile}", "r")
      f.each_line do |line|
        if line.include? "filament_diameter"
          filament_diameter = line[/\d+/].to_i
          break
        end
      end
      f.close
      readme = `perl internal/filement_metrics/filament_length.pl -d #{filament_density} -s #{filament_diameter} -f #{@gcodefile}`
    end

  
  # Get extrusion results from script : 
   
#   
     @output = @gcodefile, readme
  
#     render :text => didMakeGcode
    render :text => @output.inspect
  
  # send_file @gcodefile

#    render :text => "|sudo internal/Slic3r/slic3r.pl " + gcode_string  + stlLocation
  end
end
