class CreateSignUp < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.string :email

      t.timestamps

      t.index :email
    end
  end
end
