class AttendancesController < ApplicationController
  def index
    @attendance = Attendance.new
  end

  def create
    emp = Employee.find_by private_num: :private_num
    time = Time.now.strftime("%H:%M")
    day = Time.now.strftime("%d-%m-%Y")

    @attendance = Attendance.create(employee_id: emp.id, check_in: time, attendance_date: day)
    render json: @attendance
  end
end
