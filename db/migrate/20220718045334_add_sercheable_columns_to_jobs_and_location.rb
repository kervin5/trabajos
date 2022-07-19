class AddSercheableColumnsToJobsAndLocation < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE jobs
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('spanish', coalesce(title, '')), 'A') ||
        setweight(to_tsvector('spanish', coalesce(content,'')), 'B')
      ) STORED;
      ALTER TABLE locations
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('spanish', coalesce(name, '')), 'A')
      ) STORED;
    SQL
  end

  def down
    remove_column :jobs, :searchable
    remove_column :locations, :searchable
  end
end
