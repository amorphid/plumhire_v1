class AddIndexesForTimestampsToSignUp < ActiveRecord::Migration
  def change
    add_index :sign_ups, :created_at
    add_index :sign_ups, :updated_at
  end
end
