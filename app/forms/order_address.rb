class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :bilding, :phone_number



  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, exclusion: { in: ["-"] }
    validates_length_of :phone_number, maximum: 11 
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  attr_accessor :token
  validates :token, presence: true
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, bilding: bilding, phone_number: phone_number, user_id: user.id)
  end
end
