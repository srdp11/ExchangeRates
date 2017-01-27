class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :from
      t.string :to
      t.string :operation
      t.string :condition
      t.float :threshold
      t.float :last_notification_value

      t.timestamps
    end
  end
end
