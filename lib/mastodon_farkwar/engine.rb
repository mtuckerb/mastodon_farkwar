module MastodonFarkwar
  class Engine < ::Rails::Engine
    isolate_namespace MastodonFarkwar
  end

  def self.psk
    if Rails.env == 'test'
      return 'test'
    else
      ENV['API_PSK']
    end
  end
end
