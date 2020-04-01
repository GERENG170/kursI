class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.references :coll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
