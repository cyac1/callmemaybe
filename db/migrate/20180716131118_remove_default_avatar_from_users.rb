class RemoveDefaultAvatarFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :avatar, nil
  end
end
