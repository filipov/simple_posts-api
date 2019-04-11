# frozen_string_literal: true

configs = Rails.application.config_for(:jwt).deep_symbolize_keys!

access_configs = configs[:access_token]

access_exp = access_configs[:expiration_time].to_i

# Settings for Token base class
Config.class_eval do
  setting :token, reader: true do
    setting :algorithm, 'none'
    setting :payload, {}
    setting :secret, nil
    setting :settings, {}
    setting :verification, false
  end
end

# Settings for AccessToken
Config.class_eval do
  setting :access_token, reader: true do
    setting :algorithm, access_configs[:algorithm]

    setting :payload do
      setting :exp, access_exp
    end

    setting :secret, access_configs[:secret]

    setting :settings do
      setting :algorithm, access_configs[:algorithm]
      setting :exp_leeway, (access_exp / 50)
    end

    setting :verification, true
  end
end
