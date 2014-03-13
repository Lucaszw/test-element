class ProfilesController < ApplicationController
	def index
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(:name => params[:user][:name] ,
			:password => params[:user][:password], :sketchfab_token => params[:user][:sketchfab_token])
		session[:id] = @user.id
		session[:username] = @user.name
		@user.save
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
		@user.sketchfab_token = params[:user][:sketchfab_token]
		@user.save
		render text: "User " + @user.name + " was saved. "
	end

end
