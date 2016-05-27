class AddRoleFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_flag, :string
  end
end
