json.extract! quizproblem, :id, :statement, :marks, :option, :correctoption, :quiz_id, :created_at, :updated_at
json.url quizproblem_url(quizproblem, format: :json)
