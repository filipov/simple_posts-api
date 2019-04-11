# frozen_string_literal: true

# The class implements application GraphQL scheme
class SimplePostsApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
