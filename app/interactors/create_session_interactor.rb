class CreateSessionInteractor
  include Interactor

  def call
    if account = Account.authenticate(context.login, context.password)
      context.token = account.token
    else
      context.fail!(message: "authenticate_user.failure")
    end
  end
end
