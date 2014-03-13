class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :username
			t.string :title
			t.text :thumbnail
			t.text :description
			t.integer :rating
			t.timestamps
		end
	end
end
