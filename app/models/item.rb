class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :price, presence: true
  validates :text, presence: true

  belongs_to :user
  # has_one :buy_log
  has_one_attached :image
end