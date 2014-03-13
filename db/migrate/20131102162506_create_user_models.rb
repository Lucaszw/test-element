class CreateUserModels < ActiveRecord::Migration
	def change
		# change_column(:user_models, :sketchfab, :text)

		create_table :user_models do |t|
			t.string :name      
			t.string :thumbnail
			t.text :sketchfab
			t.string :category
			t.timestamps
		end
	end
end
