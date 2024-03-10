class Restaurant < ApplicationRecord
  # Association
  belongs_to :user

  # Scope
  scope :order_by_created, -> { order("created_at ASC") }

end
