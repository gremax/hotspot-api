class AddProviderToActions < ActiveRecord::Migration[5.2]
  def change
    add_reference :actions, :provider, type: :uuid, foreign_key: true
  end
end
