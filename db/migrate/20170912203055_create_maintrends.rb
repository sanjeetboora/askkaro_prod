class CreateMaintrends < ActiveRecord::Migration
  def change
    create_table :maintrends do |t|
      t.string :trendtitle, null: false

      t.timestamps null: false
    end
  end
end
