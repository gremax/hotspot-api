class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions, id: :uuid do |t|
      t.boolean :current, null: false, default: false
      t.string :name, null: false
      t.string :entity_uid
      t.string :entity_name
      t.text :post_text
      t.string :post_link
      t.string :post_image
      t.string :redirect_url

      t.timestamps
    end
  end
end
