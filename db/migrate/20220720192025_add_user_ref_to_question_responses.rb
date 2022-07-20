class AddUserRefToQuestionResponses < ActiveRecord::Migration[7.0]
  def change
    add_reference :question_responses, :user, null: false, foreign_key: true
  end
end
