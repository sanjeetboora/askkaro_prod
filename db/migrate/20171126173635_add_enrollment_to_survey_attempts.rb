class AddEnrollmentToSurveyAttempts < ActiveRecord::Migration
  def change
    add_column :survey_attempts, :enrollment, :string
  end
end
