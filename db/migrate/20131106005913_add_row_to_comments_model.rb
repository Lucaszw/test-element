class AddRowToCommentsModel < ActiveRecord::Migration
  def change
  	add_column :comments, :user_model_id, :int
  end
end
