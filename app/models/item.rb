class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_burde
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :shipping_period

  with_options presence: true do
    validates :product_name
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :delivery_burden_id
      validates :prefectures_id
      validates :shipping_period_id
    end
    validates :price, format: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
