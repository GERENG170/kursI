class AddUserNameToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.belongs_to :user_email
  end
end
end
