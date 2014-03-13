class AddUserIdToUserModels < ActiveRecord::Migration
  def change
  	add_column :user_models, :user_id, :int
  end
end
