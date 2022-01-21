class CreateCompany < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|

      t.string :name
      t.text :address
      t.integer :id
    end
  end
end
