# frozen_string_literal: true

# The class implements interactor of creating session
class CreateSessionInteractor
  include Interactor

  def call
    account = Account.authenticate(context.login, context.password)

    if account
      context.token = account.token
    else
      context.fail!(message: 'authenticate_user.failure')
    end
  end
end
