class AddEnableUnaccent < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION unaccent CASCADE;"
  end

  def down
    execute "DROP EXTENSION IF EXISTS unaccent;"
  end
end
