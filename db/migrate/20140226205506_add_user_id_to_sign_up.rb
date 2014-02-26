class AddUserIdToSignUp < ActiveRecord::Migration
  def change
    add_column :sign_ups, :user_id, :integer
  end
end
