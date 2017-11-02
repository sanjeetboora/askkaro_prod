class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :description
      t.string :duration
      t.string :secret_key
      t.string :total_marks, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
