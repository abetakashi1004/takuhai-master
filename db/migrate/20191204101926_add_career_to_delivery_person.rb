class AddCareerToDeliveryPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_people, :career, :integer
  end
end
