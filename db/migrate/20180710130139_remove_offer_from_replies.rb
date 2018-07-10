class RemoveOfferFromReplies < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :offer
  end
end
