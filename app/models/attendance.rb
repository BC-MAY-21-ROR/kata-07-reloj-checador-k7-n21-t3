class Attendance < ApplicationRecord
  belongs_to :employee
  validate :employee_id, :attendance_date, presence: true
end
