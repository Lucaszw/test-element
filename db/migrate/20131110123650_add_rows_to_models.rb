class AddRowsToModels < ActiveRecord::Migration
  def change
  	add_column :user_models, :sketchfab_id, :text
  	add_column :user_models, :description, :text
  	add_column :users, :sketchfab_token, :text
  end
end
