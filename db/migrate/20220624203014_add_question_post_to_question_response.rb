class AddQuestionPostToQuestionResponse < ActiveRecord::Migration[7.0]
  def change
    add_reference :question_responses, :question_posts, null: false, foreign_key: true
  end
end
