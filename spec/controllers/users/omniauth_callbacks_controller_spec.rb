require "rails_helper"
require "support/render_views"

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe '#google_oauth2' do
    before { login_user }

    it 'current user schould not be nil' do
      subject.current_user.should_not be_nil
    end

    it 'schould be response http status 200' do
      expect(response).to have_http_status(200)
    end

    it 'email schould be test@example.com' do
      expect(subject.current_user.email).to eq('test@example.com')
    end
  end
end
