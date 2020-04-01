class CreateTopiccings < ActiveRecord::Migration[6.0]
  def change
    create_table :topiccings do |t|
      t.references :coll, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps
    end
  end
end
