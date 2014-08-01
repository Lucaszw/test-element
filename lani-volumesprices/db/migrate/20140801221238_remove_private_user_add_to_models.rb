class RemovePrivateUserAddToModels < ActiveRecord::Migration
  def change
  	remove_column :users, :isPrivate, :boolean
  	add_column :user_models, :isPrivate, :boolean
  end
end
