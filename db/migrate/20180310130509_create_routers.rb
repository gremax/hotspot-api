class CreateRouters < ActiveRecord::Migration[5.2]
  def change
    create_table :routers, id: :uuid do |t|
      t.references :place, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.string :status
      t.datetime :last_pinged_at

      t.timestamps
    end
  end
end
