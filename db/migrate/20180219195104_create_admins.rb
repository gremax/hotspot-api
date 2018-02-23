class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins, id: :uuid do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :active, null: false, default: true
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end

    add_index :admins, :email, unique: true
  end
end
