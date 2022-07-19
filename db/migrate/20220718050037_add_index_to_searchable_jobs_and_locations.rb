class AddIndexToSearchableJobsAndLocations < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :jobs, :searchable, using: :gin, algorithm: :concurrently
    add_index :locations, :searchable, using: :gin, algorithm: :concurrently
  end
end
