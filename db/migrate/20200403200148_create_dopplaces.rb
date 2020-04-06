class CreateDopplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :dopplaces do |t|
      t.string :body
      t.references :dop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
