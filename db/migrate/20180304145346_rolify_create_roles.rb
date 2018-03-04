class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, type: :uuid, polymorphic: true

      t.timestamps
    end

    create_table(:admins_roles, id: false) do |t|
      t.references :admin, type: :uuid
      t.references :role
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:admins_roles, %i[admin_id role_id])
  end
end
