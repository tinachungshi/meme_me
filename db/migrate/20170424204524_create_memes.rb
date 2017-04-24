class CreateMemes < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
      t.string :title
      t.string :category
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
