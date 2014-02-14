class AddUuidToSignUp < ActiveRecord::Migration
  def change
    add_column :sign_ups, :uuid, :uuid
  end
end
