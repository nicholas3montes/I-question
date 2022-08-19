class React < ApplicationRecord
  belongs_to :question_post
  belongs_to :user
end
