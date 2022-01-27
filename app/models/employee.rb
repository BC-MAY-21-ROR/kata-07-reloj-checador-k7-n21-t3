class Employee < ApplicationRecord
  belongs_to :company
  has_many :attendance, dependent: :destroy
end
