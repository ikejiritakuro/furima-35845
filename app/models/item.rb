class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :shopping_day
  belongs_to :delivery_charge
  belongs_to :product_status

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :area_id
    validates :category_id
    validates :shopping_day_id
    validates :delivery_charge_id
    validates :product_status_id
    validates :description
    validates :price
    validates :name
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :shopping_day_id
    validates :delivery_charge_id
    validates :product_status_id
  end
end
