class ProfilesController < ApplicationController
	def index
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(:name => params[:user][:name] ,
			:password => params[:user][:password], :email => params[:user][:email])
		session[:id] = @user.id
		session[:username] = @user.name
		@user.save
		UserMailer.verification_email(@user).deliver
    
    redirect_to home_index_url and return

	end

	def edit
    @user = User.find(session[:id])
    @models = @user.user_models.all
	end

	def update
		@user = User.find(session[:id])
		@user.name = params[:user][:name]
		@user.password = params[:user][:password]
		@user.email = params[:user][:email]
		@user.save
		redirect_to home_index_url and return
	end
	
	def validation
	  @user = User.new
	end
	
	def checkIfValidated
    @user = User.find_by name: params[:user][:name]

    if @user != nil
      if @user.password == params[:user][:password] && @user.verificationcode.to_f == params[:user][:verificationcode].to_f && @user.email == params[:user][:email]
        session[:id] = @user.id
        session[:username] = @user.name
        correct = "true"
        @user.didVerify = true
        @user.save
        thisText = "Shit Worked"
      else
        thisText = "Shit Failed"
      end
    end
    
    redirect_to home_index_url
    
    
	end
	

end
