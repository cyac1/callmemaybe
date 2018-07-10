class AddOfferToReply < ActiveRecord::Migration[5.2]
  def change
    add_monetize :replies, :offer
  end
end

