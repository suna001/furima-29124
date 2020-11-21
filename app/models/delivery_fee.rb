class DeliveryFee <  ActiveHash::Base
  self.data = [
  { id: 0, name: '---' },
  { id: 1, name: '着払い（購入者支払い）' },
  { id: 2, name: '送料込み（出品者支払い）' }
 ]

 include ActiveHash::Associations
  has_many :items

end
