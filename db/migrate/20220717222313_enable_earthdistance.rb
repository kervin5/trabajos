class EnableEarthdistance < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION cube CASCADE; CREATE EXTENSION earthdistance CASCADE;"
  end

  def down
    execute "DROP EXTENSION IF EXISTS earthdistance; DROP EXTENSION IF EXISTS cube;"
  end
end
