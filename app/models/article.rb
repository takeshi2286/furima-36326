class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :derivery
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :status

  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}

end

