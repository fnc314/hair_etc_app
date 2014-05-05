class AddAuthenticationTokenToClients < ActiveRecord::Migration
  def change
    add_column :clients, :authentication_token, :string
    add_index :clients, :authentication_token
  end
end
