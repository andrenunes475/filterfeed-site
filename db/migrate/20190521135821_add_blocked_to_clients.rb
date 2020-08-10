class AddBlockedToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :authentication_failed, :boolean, default: false
  end
end
