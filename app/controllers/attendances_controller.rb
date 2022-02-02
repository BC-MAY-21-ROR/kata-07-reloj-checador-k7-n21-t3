class AttendancesController < ApplicationController
  def index
    date = params[:date]
    if !date.nil?
      @attendance = Attendance.where(attendance_date: date)
    else
      @attendance = Attendance.where(attendance_date: Time.now)
    end
    render 'index'
  end
end
