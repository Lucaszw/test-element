class CommentsController < ApplicationController
	
	def index

	end


	def create
		@model = UserModel.find(params[:comments][:model_id])
		@user = User.find(session[:id])
		@comment = Comment.new(
			:title => params[:comments][:title],
			:description => params[:comments][:description],
			:username => @user.name,
			:thumbnail => nil,
			:rating => nil)

		@model.comments << @comment
  	@model.save

  	redirect_to :controller => 'model_objects', :action => "single", :id=> @model.id

	end
	def new	
	end

end
