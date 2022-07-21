class AddPasswordPhoneRoleToUser < ActiveRecord::Migration[7.0]
  def change
    create_enum :role, %w[candidate employer admin]
    add_column :users, :phone, :string, null: true
    add_column :users,
               :role,
               :enum,
               enum_type: "role",
               default: "candidate",
               null: false
  end
end
