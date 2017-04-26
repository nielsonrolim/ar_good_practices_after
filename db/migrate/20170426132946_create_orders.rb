class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.integer :origin_device, default: 0
      t.string :latitude
      t.string :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
