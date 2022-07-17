class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, %w[draft published archived expired trashed]
    create_table :jobs do |t|
      t.string :title
      t.text :content
      t.datetime :expires_at
      t.references :author,
                   index: true,
                   null: false,
                   foreign_key: {
                     to_table: :users
                   }
      t.enum :status, enum_type: "status", default: "draft", null: false
      t.text :tags, array: true, default: []
      t.timestamps
    end
  end
end
