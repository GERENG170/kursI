class AddUserIdToColl < ActiveRecord::Migration[6.0]
  def change
    change_table :colls do |t|
      t.belongs_to :user
    end
  end
end
