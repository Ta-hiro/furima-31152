class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_burde
  belongs_to :prefectures
  belongs_to :shipping_period
  
end
