class AddUserToSurveySurveys < ActiveRecord::Migration
  def change
    add_reference :survey_surveys, :user, index: true, foreign_key: true
  end
end
