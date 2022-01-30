class Employee < ApplicationRecord
  belongs_to :company
  has_many :attendance, foreign_key: 'private_num'
  validates :name, :email, :position, :employee_num, :private_num, :company_id, presence: true
  validates :email, :employee_num, :private_num, uniqueness: true
end
