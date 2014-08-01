class RemoveSketchfab < ActiveRecord::Migration
  
  def self.up
    remove_column :user_models, :sketchfab
    remove_column :user_models, :sketchfab_id
    add_attachment :user_models, :thumbnail
  end

  def self.down
    remove_attachment :user_models, :stlfile
    add_column :user_models, :sketchfab_id
    add_column :user_models, :sketchfab
  end

end
