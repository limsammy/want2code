class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :avatar_url
      t.string :email
      t.text :about
      t.text :cover_letter
      t.string :linkedin
      t.string :github
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
