class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :email
      t.string :password
      t.boolean :approval, :boolean, default: false

      t.timestamps null: false
    end
  end
end