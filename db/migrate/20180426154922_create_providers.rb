class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers, id: :uuid do |t|
      t.references :company, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.string :api_key
      t.string :api_secret
      t.string :api_public

      t.timestamps
    end
  end
end
