class Employee < ApplicationRecord
  belongs_to :company
  has_many :attendance # , dependent: :destroy
  validate :name, :email, :position, :employee_num, :private_num, :company_id, presence: true
end
