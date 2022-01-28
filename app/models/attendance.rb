class Attendance < ApplicationRecord
  belongs_to :employee
  validates :employee_id, :attendance_date, presence: true
end
