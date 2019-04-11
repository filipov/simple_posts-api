# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  namespace :api do
    namespace :v0 do
      resource :session, only: %i[create]
    end
  end
end
