class AddIndexUuidToSignUp < ActiveRecord::Migration
  def change
    add_index :sign_ups, :uuid
  end
end
