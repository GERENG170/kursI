class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.references :coll, null: false, foreign_key: true
      t.boolean :searching, default: false
      t.timestamps
    end
  end
end
