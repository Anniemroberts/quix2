class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_reference :ideas, :user, foreign_key: true, index: true
    add_reference :reviews, :user, foreign_key: true, index: true
  end
end
