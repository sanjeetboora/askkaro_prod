class AddPeriodToSurveySurveys < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :period, :time
  end
end
