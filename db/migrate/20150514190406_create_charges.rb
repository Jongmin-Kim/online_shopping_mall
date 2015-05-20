class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|

      t.timestamps null: false
    end
    add_column :charges, :product_id, :integer
  end
end
