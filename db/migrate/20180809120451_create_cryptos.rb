class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :name_of_crypto
      t.string :cour_of_crypto
      t.timestamps
    end
  end
end
