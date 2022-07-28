class AddDislikeToQuestionPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :question_posts, :dislike, :integer
  end
end
