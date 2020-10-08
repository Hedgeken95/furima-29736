class Item < ApplicationRecord
   extend ActiveHash::Associations::ActiveRecordExtensions

     belongs_to_active_hash :category
     belongs_to_active_hash :brand
     belongs_to_active_hash :status
     belongs_to_active_hash :area
     belongs_to_active_hash :day
     belongs_to_active_hash :delivery_fee
     
  with_options presence: true do
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :area_id
      validates :day_id
    end
    
    validates :brand_id, numericality: { other_than: 1 }
    validates :item_name
    validates :item_text
    validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_9999_999
    validates :price, format: { with: /\A[0-9]+\z/}
    validates :images
  end
  validates_length_of :item_name, maximum: 40
  validates_length_of :item_text, maximum: 1000
  belongs_to :user
  has_one :order
  has_many_attached :images
  def self.search(search)
    if search != ""
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
