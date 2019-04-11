# frozen_string_literal: true

module Mutations
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

      if result.success?
        { token: result.token }
      else
        { error: result.message }
      end
    end
  end
end
