# frozen_string_literal: true

module Types
  # The class implements the root of GraphQL mutations
  class MutationType < Types::BaseObject
    field :createSession, mutation: Mutations::CreateSession
  end
end
