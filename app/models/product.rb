class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :quantities
  has_many :orders, through: :quantities
end
