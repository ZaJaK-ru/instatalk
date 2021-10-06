$redis = Redis.new(url: ENV["REDISTOGO_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
