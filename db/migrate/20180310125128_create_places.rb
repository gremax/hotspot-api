class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places, id: :uuid do |t|
      t.references :company, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
