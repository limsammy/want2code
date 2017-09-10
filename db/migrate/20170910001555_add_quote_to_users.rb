class AddQuoteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :quote, :string
  end
end
