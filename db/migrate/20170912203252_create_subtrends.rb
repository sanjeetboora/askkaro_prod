class CreateSubtrends < ActiveRecord::Migration
  def change
    create_table :subtrends do |t|
      t.string :subtitle, null: false
      t.references :maintrend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
