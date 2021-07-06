class Quantity < ApplicationRecord
    validates :quantity, presence: true

    belongs_to :product
    belongs_to :order
  end