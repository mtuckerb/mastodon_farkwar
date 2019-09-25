require_dependency "mastodon_farkwar/application_controller"

module MastodonFarkwar
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      account = Account.new(user_params)
      account.confirmed_at = Time.now
      if account.save
        render json: account.to_json
      else
        render json: {errors: [{message: 'Account could not be saved'}]}
      end

    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :agreement, :locale)
    end
  end
end
