class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :image
      t.integer :role
      t.string :password_reset_token
      t.datetime :password_reset_at

      t.timestamps null: false
    end
  end
end
