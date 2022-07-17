class AddSourceEnumToJobs < ActiveRecord::Migration[7.0]
  def change
    create_enum :source, %w[internal external]
    add_column :jobs, :external_url, :string, null: true
    add_column :jobs,
               :source,
               :enum,
               enum_type: "source",
               default: "internal",
               null: false
  end
end
