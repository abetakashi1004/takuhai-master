class AddSlipNumberToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :slip_number, :string
  end
end
