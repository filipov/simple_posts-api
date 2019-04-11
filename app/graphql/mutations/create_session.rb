# frozen_string_literal: true

module Mutations
  # The class implements mutation of creating session
  class CreateSession < GraphQL::Schema::RelayClassicMutation
    field :token, String,
          null: true,
          description: 'Account access token'

    field :error, String,
          null: true,
          description: 'Mutation operation error'

    argument :login, String,
             required: true,
             description: 'Account ID'

    argument :password, String,
             required: true,
             description: 'Account password'

    def resolve(login:, password:)
      result = CreateSessionInteractor.call(login: login, password: password)

      return { token: result.token } if result.success?

      { error: result.message }
    end
  end
end
