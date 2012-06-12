class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :integer
    add_column :users, :, :default => 0
    add_column :users, :=, :string
  end
end
