class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.string :title
      t.text :description
      t.string :options
      t.integer :correct_option
      t.integer :marks
      t.references :user, index: true, foreign_key: true
      t.references :contest, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
