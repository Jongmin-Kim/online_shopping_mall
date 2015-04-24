class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :status
      t.text :address

      t.timestamps null: false
    end
  end
end
