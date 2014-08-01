class CreateCatagories < ActiveRecord::Migration
  def change
    create_table :catagories do |t|
      t.timestamps
      t.name
    end
  end
end
