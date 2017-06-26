class Car < ApplicationRecord
  # belongs_to :owner, class_name: 'Seller'
  validates :vin, :manufacture, presence: true
end
