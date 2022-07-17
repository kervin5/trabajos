class AddLocationToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :location
  end
end
