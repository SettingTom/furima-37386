class BuyLogAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :block_number, :apartment, :phone_number, :buy_log, :user, :item, 

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :block_number
    validates :phone_number, format: {with: /\d{10,11}$/, message: "is invalid. Input only number"}
    validates :buy_log
    validates :user
    validates :item
  end

  def save
    buy_log = BuyLog.create(user: user, item:item)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, block_number: block_number, apartment: apartment, buy_log: buy_log)
  end
end