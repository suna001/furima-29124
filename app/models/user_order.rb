class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :phone_number, :city, :house_number, :building_name, :user_id, :token, :item_id
 
#addressのバリデーション
with_options presence: true do
  validates :area_id, numericality: { other_than: 0, message: "Slect" } 
  validates :city
  validates :token
  validates :house_number
  validates :building_name
  validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
end
VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

 # purchasesのバリデーション
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create!(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
