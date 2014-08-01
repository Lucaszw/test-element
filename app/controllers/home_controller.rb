class HomeController < ApplicationController

  def index
        
  	if session[:id] != nil
  		@user = User.find(session[:id])
  	else
  		@user = User.new
  	end
  	@users = User.all
  	@models = UserModel.all

  end


  def searchByName
  	
  end

  def searchByCatergory

  end

 
end
