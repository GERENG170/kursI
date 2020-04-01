class AddUserIdToDops < ActiveRecord::Migration[6.0]
  def change
    change_table :dops do |t|
      t.belongs_to :user
  end
end
end
