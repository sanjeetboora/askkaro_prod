class AddPhnoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phno, :string,default: "0000000000"
  end
end
