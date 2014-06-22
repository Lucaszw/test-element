require 'net/http'
require 'net/https'
require 'rest_client'
require 'open-uri'
require 'json'

class ModelObjectsController < ApplicationController

  before_filter :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  
  def add_to_cart
    # get user id
    # get model id
    # add to cart and show success message
  end

  def view
    
    @model = UserModel.find(params[:modelid])
    @user = User.new
    @modelsOwner = User.find(@model.user_id)
    @logged_in = false

    # @model.inspect
    # render "view"
  end

  def test
    render "test"
  end

  def index
  	@models = UserModel.all
  	render "galleryView"
  end


   def tile
     # @model = UserModel.offset(params[:k]).last(1)
#      @k     = params[:k]
   end
  
  def canvas
    @model = UserModel.find(params[:modelid])
    puts @model.id
    # @model = UserModel.find(params[:modelid])
  end

  def new
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end
    
  end 


  def single

    # Look into making this code more dry here...

    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end

    @model = UserModel.find(params[:id])
    @modelsOwner = User.find(@model.user_id)
    @logged_in = false
    if session[:id] != nil
      @logged_in = true
    end
  	# Called when clicked on a model, param = :name
  end


  def search

    # Create a verification string depended on the check box statuses
    searchType = [params[:search][:name].to_i,
    params[:search][:category].to_i]


    # If all unchecked, assume all checked :
    if (params[:search][:name].to_i + params[:search][:category].to_i) == 0
      searchType = [1,1]
    end

    paramNames = ["name", "category"]

    # Initialize last param
    lastParam = searchType.length-1

    #begin :
    searchType.reverse.each do |i|
      if searchType[i] == 1
        lastParam = i
        next
      end
    end


    # Split search string into keywords
    searchValues = params[:search][:text].split

    # Begin a strign to send to MYSQL as a query
    searchQueries = "SELECT * FROM user_models WHERE "

    catch(:stop) do
      (0..searchValues.length-1).each do |i|
        # If first parameter is defined
        (0..1).each do |j|
          if searchType[j] ==1
            searchQueries += "upper(" +paramNames[j]+ ") LIKE upper('%"
            if !(lastParam ==j && i == searchValues.length-1)
              searchQueries += searchValues[i] + "%') " + "OR "
            else
              searchQueries += searchValues[i] + "%')"
              throw :stop
            end
          end

        end
      end
    end

    #render :text => searchQueries
    # Get a collection via MYSQL query 
    @models = UserModel.find_by_sql(searchQueries)

    @searchedFor = params[:search][:text]
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      @user = User.new
    end
  end

  def create


    @user = User.find(session[:id])
    @currentModel = UserModel.new
    @currentModel.update_attributes(params[:currentModel].permit!)
    modelname = params[:currentModel][:name]
    @user.user_models << @currentModel
    @user.save!
 
    
    stlLocation = "public" + @user.user_models[-1].stlfile.url
    # remove the random numbers from the end of the file name :
    salt_point = stlLocation.length - stlLocation.index('?')
    stlLocation = stlLocation[0..-1*salt_point-1]
  
#     # also get the file name again without the extension , to get the name of the
#     # gcode file that will be generated:
#     exten_point = stlLocation.length - stlLocation.index('.')
#     filename = stlLocation[0..-1*exten_point-1]
#     @gcodefile = filename + ".gcode"    
    
    
    
    # Generate all 4 Gcode:
    basic_params = "--filament-diameter","--extrusion-multiplier","--temperature","--bed-temperature",
      "--layer-height","--first-layer-height", "--nozzle-diameter","--bed-size","--print-center",
      "--gcode-flavor","--fill-density"
    
    gcode1 = "2","1","205","110",
            "0.127","0.127","0.205", "406,356", "203,178",
            "reprap", "0.9999"
    
    gcode2 = "2","1","205","110",
             "0.33","0.33","0.33","406,356","203,178",
             "reprap", "0.9999"
    
    gcode3 = "2","1","205","110",
             "0.127","0.127","0.205","406,356","203,178", 
             "reprap", "0.34"
    
    gcode4 = "2","1","205","110",
             "0.33","0.33","0.33", "406,356","203,178",
             "reprap", "0.42"
    
    gcode   = []
    files   = []
    @metrics = []
    @volume = []
    gcode.push(gcode1,gcode2,gcode3,gcode4)
    output = Array.new(4)
    didMakeGcode = Array.new(4);
    
    for j in 0..3
      output[j] = " "
      for i in 0..10
        output[j] << " " << basic_params[i] << " " << gcode[j][i]
      end
      files[j] = "public/system/temp_gcode/gcode" + (j + 1).to_s + ".gcode"
      output[j] << " --output " << files[j]
      command = Thread.new do
        didMakeGcode[j] = system "sudo perl internal/Slic3r/slic3r.pl #{stlLocation} #{output[j]}"
      end
       
      # Make sure that the gcode is developed before continuing...
      command.join
       
      # Create readme for when errors occur (overwritten if file generated successfully)
      @metrics[j] = "error"  
      
      # Get the filament_diameter from the gcode file
      if(didMakeGcode[j] == true)
        f = File.open("#{files[j]}", "r")
          f.each_line do |line|
            if line.include? "filament_diameter"
              filament_diameter = line[/\d+/].to_i
            break
          end
        end
        f.close
        
        @volume[j] = `perl internal/filement_metrics/filament_length.pl -d #{gcode[j][basic_params.index("--fill-density")]} -s #{gcode[j][basic_params.index("--filament-diameter")]} -f #{files[j]}`

      end

    end
    @userModels = UserModel.where(:name => modelname).last
#     UserModel.where(:user_id => @user.id).order(:created_at).last
    @userModels.calculated_volumes = @volume.map { |i| "'" + i.to_s + "'" }.join(",")
     
    @userModels.save! #The ! will cause it to save so long as no errors are catched in the model 
   
  # If an error is catched, it won't render, and instead will active resuce
   redirect_to :controller => 'model_objects', :action => 'single', :id => @currentModel.id
   rescue
   redirect_to :controller => 'model_objects', :action => 'new', :errors => @volume.map { |i| "'" + i.to_s + "'" }.join(",")
    
    
  end

  def permit!
    each_pair do |key, value|
     convert_hashes_to_parameters(key, value)
      self[key].permit! if self[key].respond_to? :permit!
    end

    @permitted = true
    self
  end



end