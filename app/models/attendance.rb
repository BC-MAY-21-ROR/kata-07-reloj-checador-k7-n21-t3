class Attendance < ApplicationRecord
  belongs_to :employee , foreign_key: 'private_num'
  validates :attendance_date, presence: true
end
