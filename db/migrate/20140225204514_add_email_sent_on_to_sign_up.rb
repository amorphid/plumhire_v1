class AddEmailSentOnToSignUp < ActiveRecord::Migration
  def change
    add_column :sign_ups, :email_sent_on, :datetime
    add_index :sign_ups, :email_sent_on
  end
end
