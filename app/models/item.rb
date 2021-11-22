class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  with_options presence: true do
    validates :name, presence: true, length: { maximum: 40 }
    validates :content, presence: true, length: { maximum: 1000 }
    validates :category_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :status_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :shipping_fee_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :prefecture_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :derivery_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :price , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} , format: { with: /\A[0-9]+\z/ }
  end
end
