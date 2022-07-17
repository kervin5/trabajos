class RemoveTagsFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :tags
  end
end
