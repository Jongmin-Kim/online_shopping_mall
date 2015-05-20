class AddAmountAndTimeToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :amount, :integer
    add_column :charges, :time, :datetime
  end
end
