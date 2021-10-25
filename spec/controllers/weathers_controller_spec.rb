require "rails_helper"
require "support/render_views"

RSpec.describe WeathersController, type: :controller do
  describe "GET #index" do
    subject(:request_index) { get :index }

    before { login_user }

    let(:weathers) { create_list(:reservation, 10) }

    it { is_expected.to be_successful }
  end

  describe "GET #new" do
    context "when user is logged" do
      subject { get :new, xhr: true }

      before { login_user }

      it { is_expected.to be_successful }
    end

    context "when user is not logged" do
      subject { get :new, xhr: true }

      it { is_expected.not_to be_successful }
    end
  end

  describe "POST #create" do
    subject(:request_create) do
      get :create, xhr: true, params: { weather: attributes }
    end

    context "with valid attributes" do
      before { login_user }

      let(:attributes) { attributes_for :weather }

      it { expect { request_create }.to change(Weather, :count).by(1) }
      it { is_expected.to redirect_to(weathers_url) }
    end
  end

  describe "PUT #update" do
    subject(:request_update) do
      put :update, xhr: true, params: { id: weather.id, weather: attributes }
    end

    before { login_user }

    let!(:weather) { create(:weather) }

    context "with valid attributes" do
      let(:attributes) { attributes_for :weather }

      it { is_expected.to redirect_to(weathers_url) }
      it { is_expected.to be_successful }
    end
  end

  describe 'DELETE #destroy' do
    subject(:request_destroy) do
      delete :destroy, params: { id: weather.id }, xhr: true
    end

    let!(:weather) { create(:weather) }

    before { login_user }

    it { is_expected.to be_successful }
    it { is_expected.to redirect_to(weathers_url) }
  end
end
