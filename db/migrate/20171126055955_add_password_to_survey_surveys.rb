class AddPasswordToSurveySurveys < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :password, :string
  end
end
