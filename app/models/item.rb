class Item < ApplicationRecord
  #attr_accessible :price, :name, :real, :description, :weight

  validates :price,  numericality: {greater_then: 0, allow_nil: true} 
  validates :name, :description, presence: true

  #has_and_belongs_to_many :cards
  has_many :positions
  has_many :carts, through: :positions

  has_many :comments, as: :commentable
end
