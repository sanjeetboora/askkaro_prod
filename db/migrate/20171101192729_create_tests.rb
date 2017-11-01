class CreateTests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.string :secret_key
      t.integer :total_marks, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
