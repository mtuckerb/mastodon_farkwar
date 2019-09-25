module MastodonFarkwar
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate

    def authenticate
      render json: "Permission denied", status: 403 unless params[:psk] == MastodonFarkwar.psk
    end
  end
end
