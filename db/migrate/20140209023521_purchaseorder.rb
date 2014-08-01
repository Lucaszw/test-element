class Purchaseorder < ActiveRecord::Migration
  def change
  	add_column :user_models, :price, :float
  end
end
