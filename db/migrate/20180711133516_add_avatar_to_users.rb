class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, default: "https://smallbusinessbc.ca/wp-content/themes/sbbcmain/images/default-avatar.svg"
  end
end
