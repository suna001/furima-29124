class Item < ApplicationRecord
  ### Association
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0, message: "Slect" } 
    validates :condition_id, numericality: { other_than: 0, message: 'status Select' } 
    validates :delivery_fee_id, numericality: { other_than: 0, message: 'fee status Select' } 
    validates :area_id, numericality: { other_than: 0, message: 'Select' } 
    validates :shipping_day_id, numericality: { other_than: 0, message: 'delivery Select' } 
  end
  
 validates :price, numericality: { only_integer: true, message: 'Half-width number' } 
 validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9999999, message: 'Out of setting range' } 


 
end