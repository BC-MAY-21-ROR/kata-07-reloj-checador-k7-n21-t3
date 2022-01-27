class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :position
      t.integer :employee_num
      t.integer :private_num

      t.timestamps
    end
  end
end
