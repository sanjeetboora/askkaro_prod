class Like < Socialization::ActiveRecordStores::Like
  belongs_to :question
  belongs_to :answer
  belongs_to :user
end
