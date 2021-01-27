require 'rails_helper'

RSpec.describe User, type: :model do
  it "姓、名、メール、パスワードがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名がない場合、無効である" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "姓がない場合、無効である" do
    user = FactoryBot.build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "メールアドレスがない場合、無効である" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスの場合、無効である" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "パスワードがない場合、無効である" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end
