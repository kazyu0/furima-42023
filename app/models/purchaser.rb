class Purchaser < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :destination
  
end