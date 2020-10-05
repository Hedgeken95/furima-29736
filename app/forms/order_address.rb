class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :bilding, :phone_number, :item_id, :user_id, :token


  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]+\z/}
    validates_length_of :phone_number, maximum: 11 
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, bilding: bilding, phone_number: phone_number, order_id: order.id)
  end
end
