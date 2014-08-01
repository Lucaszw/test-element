class CreateModelUploads < ActiveRecord::Migration
  def change
    create_table :model_uploads do |t|

      t.timestamps
    end
  end
end
