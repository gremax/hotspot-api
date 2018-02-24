class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, id: :uuid do |t|
      t.uuid :owner_id, null: false
      t.boolean :active, null: false, default: true
      t.string :name, null: false

      t.timestamps
    end

    add_foreign_key :companies, :admins, column: :owner_id
  end
end
