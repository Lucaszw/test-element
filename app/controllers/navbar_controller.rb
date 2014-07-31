class NavbarController < ApplicationController
  def index
    
  end

  def create
    correct = "false"

    @user = User.find_by name: params[:user][:name]

    if @user != nil 
      @userPassword = params[:user][:password]
      if @userPassword == @user.password
        session[:id] = @user.id
        session[:username] = @user.name
        correct = "true"
      else
        error = false
      end
    end
         
    redirect_to home_index_url and return

  end

  def logout
    session[:id] = nil
    session[:username] = nil
    redirect_to home_index_url and return
  end

end
