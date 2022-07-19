class EnableFuzzystrmatch < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION fuzzystrmatch CASCADE;"
  end

  def down
    execute "DROP EXTENSION IF EXISTS fuzzystrmatch;"
  end
end
