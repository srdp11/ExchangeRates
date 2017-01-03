class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.float :usd_sell
      t.float :usd_buy
      t.float :eur_sell
      t.float :eur_buy

      t.timestamps
    end
  end
end
