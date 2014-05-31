class AddUserIdToUserModels < ActiveRecord::Migration
  def change
  	add_column :user_models, :user_id, :string
  end
end
