class AddVolumeRowsToModels < ActiveRecord::Migration
  def change
    add_column :user_models, :calculated_volumes, :string
  end
end
