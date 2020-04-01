class CreateDops < ActiveRecord::Migration[6.0]
  def change
    create_table :dops do |t|
      t.string :type
      t.string :name
      t.references :coll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
