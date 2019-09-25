require_dependency "mastodon_farkwar/application_controller"

module MastodonFarkwar
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      ::User.create(user_params)
    end

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
