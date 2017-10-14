class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    t.string :content,null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
