require 'rails_helper'

describe User do
  describe '#create' do

    context 'every box is filled in' do
      let(:user){ build(:user)}
      it "is valid with a nickname, email, password, password_confirmation" do
        expect(user).to be_valid
      end
    end

    context 'email is blank' do
      let(:user){ build(:user, email: nil)}
      it "is invalid without an email" do
        user.valid?
        expect(user.errors[:email]).to include("を入力してください。")
      end
    end

    context 'nickname is blank' do
      let(:user){ build(:user, nickname: nil)}
      it "is invalid without a nickname" do
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください。")
      end
    end

    context 'password is blank' do
      let(:user){ build(:user, password: nil)}
      it "is invalid without a password" do
        user.valid?
        expect(user.errors[:password]).to include("を入力してください。")
      end
    end

    context 'password_confirmation is blank' do
      let(:user){ build(:user, password_confirmation: "")}
      it "is invalid without a password_confirmation although with a password" do
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
      end
    end

    context 'email already exists' do
      let(:user){ create(:user)}
      let(:another_user){ build(:user, email: user.email)}
      it "is invalid with a duplicate email address" do
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します。")
      end
    end

    context 'password is too short' do
      let(:user){ build(:user, password: "00000", password_confirmation: "00000")}
      it "is invalid with a password that has less than 7 characters " do
        user.valid?
        expect(user.errors[:password][0]).to include("は8文字以上で入力してください。")
      end
    end

  end
end
