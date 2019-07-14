class AddDiscountToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :discount, :integer
  end
end
