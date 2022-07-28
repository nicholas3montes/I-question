class AddReactToQuestionPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :question_posts, :react, :string
  end
end
