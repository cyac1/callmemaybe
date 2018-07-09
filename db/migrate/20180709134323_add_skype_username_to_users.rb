class AddSkypeUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :skype_username, :string
  end
end
