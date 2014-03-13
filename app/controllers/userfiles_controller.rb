class UserfilesController < ApplicationController
  before_filter :require_user, :only => 'show'
  def display
  end
end
