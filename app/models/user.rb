class User < ApplicationRecord
  has_many :QuestionPost
  has_many :React
end
