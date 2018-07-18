class AddOfferToConversations < ActiveRecord::Migration[5.2]
  def change
    add_monetize :conversations, :offer, currency: {present: false}
  end
end
