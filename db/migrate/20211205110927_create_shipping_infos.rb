class CreateShippingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infos do |t|
      t.string :post_number,        null: false
      t.integer :prefecture_id,     null: false
      t.string :purchaser_city,     null: false
      t.string :purchaser_address,  null: false
      t.string :purchaser_building
      t.string :telephone_number,   null: false
      t.references :purchase_record,null: false, foreign_key: true
      t.timestamps
    end
  end
end
