class GeneratorController < ApplicationController
  def form
    @model = UserModel.find(params[:modelid])
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end
    
  end
  def download
    params[:gcode]
  end
  def submit

  # get the url of the model being printed :
  model = UserModel.find(params[:generator][:modelid])
  params[:generator].delete :modelid

  `clear`

  # replace g-code unfriendly parameters with friendly ones :
  center_point = params[:generator][:center_of_print_x] +
   "," + params[:generator][:center_of_print_y]
  params[:generator].delete :center_of_print_x
  params[:generator].delete :center_of_print_y
  params[:generator][:print_center] = center_point

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

  string = open("|sudo internal/Slic3r/slic3r.pl " + gcode_string  + stlLocation).read()
  send_file @gcodefile
  # render :text => "|sudo internal/Slic3r/slic3r.pl " + gcode_string  + stlLocation
  end
end
