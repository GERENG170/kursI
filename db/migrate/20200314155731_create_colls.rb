class CreateColls < ActiveRecord::Migration[6.0]
  def change
    create_table :colls do |t|
      t.string :title
      t.text :body
      t.boolean :searching, default: false
      t.timestamps
    end
  end
end
