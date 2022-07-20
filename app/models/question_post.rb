class QuestionPost < ApplicationRecord
  belongs_to :user
  has_many :question_responses
end
