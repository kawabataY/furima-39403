class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.references :order,      null: false, foreign_key: true
      t.string     :post_num,       null: false, default: ""
      t.integer    :prefecture_id,  null: false
      t.string     :city,           null: false, default: ""
      t.string     :street_number,  null: false, default: ""
      t.string     :building_name
      t.string     :phone_num,      null: false, default: ""
      t.timestamps
    end
  end
end
