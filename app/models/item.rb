class Item < ApplicationRecord
  validates :item_name, presence: true

  validates :price, presence: true
  validates_inclusion_of :price, in: 300..9_999_999, numericality: { only_integer: true }

  validates :text, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_pay_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  belongs_to :user
  has_one :buy_log
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :delivery_pay
  belongs_to :delivery_day
  belongs_to :area
  belongs_to :category
end
