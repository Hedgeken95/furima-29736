class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    belongs_to_active_hash :category
    validates :category_id, numericality: { other_than: 1 }

    belongs_to_active_hash :status
    validates :status_id, numericality: { other_than: 1 }

    belongs_to_active_hash :delivery_fee
    validates :delivery_fee_id, numericality: { other_than: 1 }

    belongs_to_active_hash :area
    validates :area_id, numericality: { other_than: 1 }

    belongs_to_active_hash :day
    validates :day_id, numericality: { other_than: 1 }

    validates_length_of :item_name, maximum: 40
    validates_length_of :item_text, maximum: 1000
    validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_9999_999
    validates :price, format: { with: /\A[0-9]+\z/}
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
