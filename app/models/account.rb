# frozen_string_literal: true

# @author Andrey Filipov <andrey@filipov.ws>
# The class implements the account model
#
# @!attribute [rw] id
#   @return [Integer] Unique ID
#
# @!attribute [rw] login
#   @return [String] Account user-friendly ID
#
# @!attribute [w] password
#   Account password
#
# @!attribute [w] password_confirmation
#     Account password confirmation
#
# @example
#
#   Account.new(login: 'marina', password: 'aaaBBB22')
#
#   # => #<Account id: nil, login: "marina", password_digest: "$2a...",
#   #              deleted_at: nil, created_at: nil, updated_at: nil>
#
#   Account.create(login: 'marina', password: 'aaaBBB22')
#
#   # => #<Account id: 1, login: "marina", password_digest: "$2a...",
#   #              deleted_at: nil, created_at: "2019-04-11 12:24:37",
#   #              updated_at: "2019-04-11 12:24:37">
#
#   account = Account.find_by(login: 'marina')
#
#   # => #<Account id: 1, login: "marina", password_digest: "$2a...",
#   #              deleted_at: nil, created_at: "2019-04-11 12:24:37",
#   #              updated_at: "2019-04-11 12:24:37">
#
#   account.authenticate('notright')
#
#   # => false
#
#   account.authenticate('aaaBBB22')
#
#   # => #<Account id: 1, login: "marina", password_digest: "$2a...",
#   #              deleted_at: nil, created_at: "2019-04-11 12:24:37",
#   #              updated_at: "2019-04-11 12:24:37">
#
#   account.token
#
#   # => "ey...Dk4Njg3NH0.5xHIFZ6rKZ2rHUKheLmQ1jkEWmu9aiNVfcsnfvWBveg"
#
#   Account.authenticate('marina', 'notright')
#
#   # => false
#
#   Account.authenticate('marina', 'aaaBBB22')
#
#   # => #<Account id: 1, login: "marina", password_digest: "$2a...",
#   #              deleted_at: nil, created_at: "2019-04-11 12:24:37",
#   #              updated_at: "2019-04-11 12:24:37">
#
#   Account.authenticate('marina2', 'aaaBBB22')
#
#   # => false
class Account < ApplicationRecord
  # Implements the soft-delete pattern, used column deleted_at, used
  # default_scope, override methods: delete, destroy, etc...
  acts_as_paranoid column: :deleted_at

  # Adds methods to set and authenticate against a BCrypt password. This
  # mechanism requires you to have a password_digest attribute
  has_secure_password

  validates :login,
            format: { with: /[a-z0-9_\-]{3,16}/ },
            uniqueness: true

  validates :password,
            password: {
              length: { minimum: 8 },
              special: { required: false }
            }

  class << self
    # @!method authenticate
    # Find user by login and password
    #
    # @return [FalseClass, Account]
    def authenticate(login, password)
      find_by(login: login).try(:authenticate, password)
    end
  end

  # @!method token
  #
  # @return [Token] User access token
  def token
    AccessToken.new(id: id).token
  end
end
