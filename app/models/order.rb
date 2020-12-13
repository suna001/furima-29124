class Order < ApplicationRecord
  has_one :address
  belongs_to :user, optional: true
  belongs_to :item

end
