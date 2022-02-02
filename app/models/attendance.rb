class Attendance < ApplicationRecord
  belongs_to :employee, foreign_key: :private_num, primary_key: :private_num
end
