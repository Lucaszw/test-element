class AddPrivateOption < ActiveRecord::Migration
  def change
  	add_column :users, :isPrivate, :boolean
  end
end
