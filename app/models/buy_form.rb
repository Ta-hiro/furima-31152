class BuyForm
  include ActiveModel::Model
   attr_accessor :postal_code, :phone_number, :prefectures_id, :city, :house_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, phone_number: phone_number, postal_code: postal_code, prefectures_id: prefectures_id, city: city, house_number: house_number)
    
  end

end