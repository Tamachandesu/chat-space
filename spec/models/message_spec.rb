require 'rails_helper'

describe Message do
  describe '#create' do
    context 'textbox is filled in' do
      let(:group){ build(:group) }
      let(:user){ build(:user) }
      let(:message){ build(:message, group: group, user: user) }
      it "is valid with a text" do
        expect(message).to be_valid
      end
    end

    context 'text box is blank' do
      let(:message){ build(:empty_message) }
      it "is invalid without a text" do
        message.valid?
        expect(message.errors[:text]).to include("を入力してください。")
      end
    end
  end
end
