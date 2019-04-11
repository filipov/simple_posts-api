# frozen_string_literal: true

# Class implements User Access token based on JWT
class AccessToken < Token
  # @!method account
  #
  # @return [Account]
  #   Token owner
  def account
    Account.find(data['id'])
  end
end
