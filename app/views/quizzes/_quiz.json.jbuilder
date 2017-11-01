json.extract! quiz, :id, :title, :description, :duration, :secret_key, :total_marks, :user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
