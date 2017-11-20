class CreateQuizproblems < ActiveRecord::Migration
  def change
    create_table :quizproblems do |t|
      t.string :statement
      t.integer :marks
      t.string :option
      t.string :correctoption
      t.references :quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
