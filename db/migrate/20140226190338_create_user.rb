class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.uuid   :uuid

      t.index :email
      t.index :password_digest
      t.index :uuid

      t.timestamps

      t.index :created_at
      t.index :updated_at
    end
  end
end
