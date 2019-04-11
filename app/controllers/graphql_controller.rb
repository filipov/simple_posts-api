# frozen_string_literal: true

# GraphQL Controller
class GraphqlController < ApplicationController
  # @!method execute
  #
  # The method for execution GraphQL Scheme
  def execute
    result = SimplePostsApiSchema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )

    render json: result
  end

  private

  # @!method ensure_hash(ambiguous_param)
  #   Handle form data, JSON body, or a blank value
  #
  # @param ambiguous_param [String, Hash, ActionController::Parameters]
  #
  # @return [Hash]
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      return {} if ambiguous_param.blank?

      ensure_hash(JSON.parse(ambiguous_param))
    when Hash, ActionController::Parameters
      ambiguous_param
    else {}
    end
  end

  # @!method query
  #   Graphql query scheme
  #
  # return [ActionController::Parameters]
  def query
    params[:query]
  end

  # @!method variables
  #   Graphql variables
  #
  # return [Hash]
  def variables
    ensure_hash(params[:variables])
  end

  # @!method context
  #   Query context
  #
  # return [Hash]
  def context
    {}
  end

  # @!method operation_name
  #
  # return [String]
  def operation_name
    params[:operationName]
  end
end
