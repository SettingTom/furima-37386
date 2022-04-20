require 'rails_helper'

RSpec.describe BuyLogAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_log_address = FactoryBot.build(:buy_log_address, user_id: user.id, item_id: item.id)
      sleep 0.2
    end

    context '商品購入できるとき' do
      it 'post_code, area_id, municipalities, block_number, phone_number, tokenが存在すれば購入できる' do
        expect(@buy_log_address).to be_valid
      end
      it 'apartmentが空でも購入できる' do
        @buy_log_address.apartment = ''
        expect(@buy_log_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @buy_log_address.post_code = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @buy_log_address.post_code = '1234567'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが全角数字を含むと購入できない' do
        @buy_log_address.post_code = '１23-4567'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県に「---」が選択されている場合は出品できない' do
        @buy_log_address.area_id = 1
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @buy_log_address.municipalities = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'block_numberが空だと購入できない' do
        @buy_log_address.block_number = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @buy_log_address.phone_number = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁の半角数値だと購入できない' do
        @buy_log_address.phone_number = '123456789'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが12桁の半角数値だと購入できない' do
        @buy_log_address.phone_number = '123456789012'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが全角数字を含むと購入できない' do
        @buy_log_address.phone_number = '123456789１０'
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'tokenが空だと購入できない' do
        @buy_log_address.token = ''
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ購入できない' do
        @buy_log_address.user_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @buy_log_address.item_id = nil
        @buy_log_address.valid?
        expect(@buy_log_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
