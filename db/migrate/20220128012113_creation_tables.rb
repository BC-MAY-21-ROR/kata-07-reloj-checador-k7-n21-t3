class CreationTables < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.boolean :disable, default: false
      t.timestamps
    end

    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :position, null: false
      t.integer :employee_num, unique: true, null: false
      t.integer :private_num, unique: true, null: false
      t.belongs_to :company, foreign_key: true, null: false
      t.boolean :disable, default: false
      t.timestamps
    end

    create_table :attendances do |t|
      t.belongs_to :employee, foreign_key: true
      t.date :attendance_date
      t.time :check_in
      t.time :check_out
      t.timestamps
    end
  end
end
