class AddOperationToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :operation, :string
  end
end
