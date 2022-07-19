class EnablePgTrgm < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION pg_trgm CASCADE;"
  end

  def down
    execute "DROP EXTENSION IF EXISTS pg_trgm;"
  end
end
