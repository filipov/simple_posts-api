# frozen_string_literal: true

# Migration CreateAccounts
class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    table_comment = 'The table stores administrator / moderator accounts'

    create_table :accounts, comment: table_comment do |t|
      t.string :login,
               null: false,
               unique: true,
               default: '',
               comment: 'Account ID'

      t.string :password_digest,
               null: false,
               default: '',
               comment: 'Password hash storage'

      t.timestamp :deleted_at,
                  comment: 'Implementing soft deletion, keeps record ' \
                           'deletion time'

      t.timestamps
    end

    add_index :accounts, :login
    add_index :accounts, :deleted_at
  end
end
