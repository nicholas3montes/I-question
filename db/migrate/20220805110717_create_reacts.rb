class CreateReacts < ActiveRecord::Migration[7.0]
  def change
    create_table :reacts do |t|
      t.references :question_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :react

      t.timestamps
    end
  end
end
