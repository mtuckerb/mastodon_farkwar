require_dependency "mastodon_farkwar/application_controller"

module MastodonFarkwar
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      token = ::AppSignUpService.new.call(app, params)
      user = ::Account.find_by(domain: nil, username: user_params[:username])&.user
      user.confirm
      if user.save
        render json: user.to_json
      else
        render json: {errors: [{message: 'Account could not be saved'}]}
      end

    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :agreement, :locale)
    end

    def app
      Doorkeeper::Application.first
    end
  end
end
