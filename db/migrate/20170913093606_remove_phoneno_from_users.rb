class RemovePhonenoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phoneno, :string
  end
end
