require 'rails_helper'

describe MessagesController do

  let(:user){ create(:user) }

  login_user

  let(:group){ create(:group) }
  let(:message){ create(:message, group_id: group.id, user_id: user.id) }
  let(:messages){ create_list(:message, 3, user: user, group: group )}

  subject { post :create, group_id: group, message: attributes_for(:message)}

  describe 'GET #index' do
    before do
      get :index, group_id: group
    end

    it "renders the :index templete" do
      expect(response).to render_template :index
    end

    it "assign the requested contact to @group" do
      expect(assigns(:group)).to eq group
    end

    it "assign the requested contact to @messages" do
      expect(assigns(:messages)).to eq messages
    end
  end

  describe 'POST #create' do

    context "when success create new message" do
      it "should increment the Message count" do
        expect do
          subject
        end.to change(Message, :count).by(1)
      end
      it "render the :index templete" do
        subject.should redirect_to group_messages_path
      end
    end

    context "when not success create new message" do
      it "should not increment the Message count" do
        expect do
          post :create, group_id: group, message: attributes_for(:message, text: "", group_id: group.id, user_id: user.id)
        end.not_to change(Message, :count)
      end
      it "renders the :index templete include flash message" do
        post :create, group_id: group, message: attributes_for(:message, text: "", group_id: group.id, user_id: user.id)
        expect(flash[:notice]).not_to be_empty
      end
    end
  end
end
