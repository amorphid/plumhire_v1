# -----START => ActiveRecordModel-----
ar_migration = ActiveRecord::Migration
ar_migration.create_table :active_record_models, temporary: true do |t|
  t.uuid :uuid
end

ActiveRecordModel = Class.new(ApplicationModel)
# -----END => ActiveRecordModel-----

Fabricator(:active_record_model) do
end
