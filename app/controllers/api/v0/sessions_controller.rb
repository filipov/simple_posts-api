# frozen_string_literal: true

module Api
  module V0
    # The class implements REST API for Session
    class SessionsController < ApplicationController
      def create
        result = CreateSessionInteractor.call(session_params)

        if result.success?
          render status: :created, json: { token: result.token }
        else
          render status: :unprocessable_entity, json: { error: result.message }
        end
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
