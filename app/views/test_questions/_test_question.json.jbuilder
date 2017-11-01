json.extract! test_question, :id, :title, :description, :options, :correct_option, :marks, :user_id, :created_at, :updated_at
json.url test_question_url(test_question, format: :json)
