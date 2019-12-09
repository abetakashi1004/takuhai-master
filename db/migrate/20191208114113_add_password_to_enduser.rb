class AddPasswordToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :password, :string
  end
end
