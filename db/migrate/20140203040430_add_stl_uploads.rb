class AddStlUploads < ActiveRecord::Migration
  def self.up
    add_attachment :user_models, :stlfile
  end

  def self.down
    remove_attachment :user_models, :stlfile
  end
end
