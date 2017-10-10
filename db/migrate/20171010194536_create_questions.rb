class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: 500
      t.string :description

      t.timestamps
    end
  end
end
