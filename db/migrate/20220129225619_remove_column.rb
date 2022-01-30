class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :employee_id
    add_column :attendances, :private_num, :integer
    add_index :employees, :private_num, unique: true
    add_foreign_key :attendances, :employees, column: :private_num, primary_key: :private_num
  end
end
