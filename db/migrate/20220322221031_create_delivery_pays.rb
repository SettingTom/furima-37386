class CreateDeliveryPays < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_pays do |t|

      t.timestamps
    end
  end
end
