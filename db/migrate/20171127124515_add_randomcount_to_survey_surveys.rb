class AddRandomcountToSurveySurveys < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :randomcount, :integer
  end
end
