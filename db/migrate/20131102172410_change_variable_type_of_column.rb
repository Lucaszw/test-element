class ChangeVariableTypeOfColumn < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :user_models do |t|
        dir.up   { t.change :sketchfab, :text }
        dir.down { t.change :sketchfab, :string }
      end
    end
  end
end
