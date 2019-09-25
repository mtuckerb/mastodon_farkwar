require 'test_helper'

module MastodonFarkwar
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @authentication = {psk: 'test'}
      @params = {user: {email: 't@t.com', password: 'testpw'}}.merge @authentication
    end

    test "403 without psk" do
      post users_path
      assert(response.code == "403")
    end
    
    test "create user" do
      post users_url, params: @params
      assert(User.find_by(email: 't@t.com'))
    end
  end
end
