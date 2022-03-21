require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、
          family_name、family_name、family_name_kana、family_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end  
    end
  end

end