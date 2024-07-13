class Restaurant < ApplicationRecord
  scope :order_by_created, -> { order(created_at: :asc)}
  validates :name, :address, presence: true

  
end
