class CreateTableJob < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text   :body
      t.uuid   :uuid

      t.timestamps

      t.index :body
      t.index :created_at
      t.index :title
      t.index :uuid
      t.index :updated_at
    end
  end
end
