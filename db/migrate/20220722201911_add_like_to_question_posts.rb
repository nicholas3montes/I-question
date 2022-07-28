class AddLikeToQuestionPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :question_posts, :like, :integer
  end
end
