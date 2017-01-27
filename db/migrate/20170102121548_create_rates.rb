class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :from
      t.string :to
      t.float :sell
      t.float :buy

      t.timestamps
    end
  end
end
