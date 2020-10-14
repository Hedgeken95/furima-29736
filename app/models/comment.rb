class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :text, presence: true
  validates_length_of :text, minimum: 6
end
