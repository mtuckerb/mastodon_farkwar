class AddConfirmedAtToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :confirmed_at, :datetime
  end
end
