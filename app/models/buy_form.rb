class BuyForm
  include ActiveModel::Model
   atter_accessor :user, :item, :buy, :postal_code, :phone_number,
                  :prefectures_id, :city, :house_number, :building_name

  with_options presence: true do
    validates :phone_number, format: { /\A\d{10,11}\z/ } 
    validates :postal_code, format: { /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
    validates :house_number
  end
  
  def save

    Address.create(order_id: order.id, phone_number: phone_number, postal_code: postal_code, prefectures_id: prefectures_id, city: city, house_number: house_number)
    Order.create(user_id: user.id, item_id: item.id)
  end

end