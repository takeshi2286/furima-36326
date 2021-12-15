class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee
  belongs_to :category
  belongs_to :derivery
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :derivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
end
