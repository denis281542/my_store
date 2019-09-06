class Item < ApplicationRecord
  validates :price, { numbericality: {greater_then: 0, allow_nil: true} }
end
