class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer    :category_id     , null: false
      t.integer    :derivery_id     , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :shipping_fee_id     , null: false
      t.integer    :status_id     , null: false
      t.timestamps
    end
  end
end
