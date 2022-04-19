class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :buy_log
  belongs_to :address
end
