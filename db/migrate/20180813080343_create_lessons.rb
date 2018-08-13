class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :language
      t.string :level
      t.text :description
      t.integer :duration
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
