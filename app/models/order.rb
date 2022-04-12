class Order < ApplicationRecord
  belongs_to :buy_log
  belongs_to :address
end
