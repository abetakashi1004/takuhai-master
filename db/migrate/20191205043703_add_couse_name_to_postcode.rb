class AddCouseNameToPostcode < ActiveRecord::Migration[5.2]
  def change
    add_column :postcodes, :course_name, :string
  end
end
