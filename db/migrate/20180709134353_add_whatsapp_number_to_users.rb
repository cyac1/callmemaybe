class AddWhatsappNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :whatsapp_number, :string
  end
end
