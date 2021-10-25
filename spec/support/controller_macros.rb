module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user, email: 'test@example.com')

    sign_in user
  end
end
