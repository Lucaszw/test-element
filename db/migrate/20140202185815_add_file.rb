class AddFile < ActiveRecord::Migration
  def self.up
    add_attachment :model_uploads, :stlfile
  end

  def self.down
    remove_attachment :model_uploads, :stlfile
  end

end
