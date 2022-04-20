class BuyLogAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :block_number, :apartment, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :block_number
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }
    validates :phone_number, format: { with: /\d{10,11}\z/, message: 'is too short' }, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, block_number: block_number,
                   apartment: apartment, phone_number: phone_number, buy_log_id: buy_log.id)
  end
end
