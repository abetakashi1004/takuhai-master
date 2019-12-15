class RemovePasswordFromSalesOffice < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_offices, :password, :string
  end
end
