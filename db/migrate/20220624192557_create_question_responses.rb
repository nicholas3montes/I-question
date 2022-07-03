class CreateQuestionResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :question_responses do |t|
      t.string :response

      t.timestamps
    end
  end
end
