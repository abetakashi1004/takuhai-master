class AddSalesOfficeIdToPostcode < ActiveRecord::Migration[5.2]
  def change
    add_column :postcodes, :sales_office_id, :integer
  end
end
