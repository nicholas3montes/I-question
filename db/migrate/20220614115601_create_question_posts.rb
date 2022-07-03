class CreateQuestionPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :question_posts do |t|
      t.string :question

      t.timestamps
    end
  end
end
