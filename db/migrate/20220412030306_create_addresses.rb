class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,      null: false
      t.string     :area_id,        null: false
      t.string     :municipalities, null: false
      t.string     :block_number,   null: false
      t.string     :apartment
      t.string     :phone_number,   null: false
      t.references :buy_log,        null: false, foreign_key: true
      t.timestamps
    end
  end
end