class AddEmailVerification < ActiveRecord::Migration
  def change
    add_column :users, :verificationcode, :integer
    add_column :users, :didVerify, :boolean
  end
end
