class Item < ApplicationRecord
  ### Association
  has_one_attached :image
  belongs_to :user
  # has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :shipping_day

  
  
  validates :name, :description, :category_id, :condition_id, :area_id,:delivery_fee_id, :shipping_day_id, :user, presence: true 
  validates :category_id, numericality: { other_than: 0 } 
  validates :condition_id, numericality: { other_than: 0 } 
  validates :delivery_fee_id, numericality: { other_than: 0 } 
  validates :area_id, numericality: { other_than: 0 } 
  validates :shipping_day_id, numericality: { other_than: 0 } 

  
  validates:price,  format: { with: /\d{3,7}/ ,message: '半角数字で入力してください'} do
  end

end
