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


  def galleryView
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
    
#     Generate all 4 Gcode:
  

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
    # Placed validations into the Model Class
    # to catch an error message , use rescue xxxxx
    # to catch all errors use just rescuse

    @user = User.find(session[:id])
    @currentModel = UserModel.new
    @currentModel.update_attributes(params[:currentModel].permit!)
    @user.user_models << @currentModel
    @user.save! #The ! will cause it to save so long as no errors are catched in the model
    # If an error is catched, it won't render, and instead will active resuce
    redirect_to :controller => 'model_objects', :action => 'single', :id => @currentModel.id
   rescue
    redirect_to :controller => 'model_objects', :action => 'new', :errors => "error"
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