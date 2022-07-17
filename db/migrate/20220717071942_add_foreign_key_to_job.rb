class AddForeignKeyToJob < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :jobs, :locations
  end
end
