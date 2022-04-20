FactoryBot.define do
  factory :buy_log_address do
    post_code { '123-4567' }
    area_id { 2 }
    municipalities { '東京都' }
    block_number { '1-1' }
    apartment { '東京ハイツ' }
    phone_number { Faker::Number.between(from: 0o000000000, to: 99_999_999_999) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
