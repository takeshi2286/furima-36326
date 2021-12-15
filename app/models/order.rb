class Order
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :purchaser_city, :purchaser_address, :purchaser_building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}[-][0-9]{4}\Z/}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :purchaser_city
    validates :purchaser_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\Z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(post_number: post_number, prefecture_id: prefecture_id, purchaser_city:purchaser_city, purchaser_address:purchaser_address, purchaser_building:purchaser_building, telephone_number:telephone_number, purchase_record_id: purchase_record.id)
  end



end