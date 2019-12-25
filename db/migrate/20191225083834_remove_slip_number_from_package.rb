class RemoveSlipNumberFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :slip_number, :integer
  end
end
