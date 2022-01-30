class PagesController < ApplicationController
  def home
    @attendance = Attendance.new
  end
  def create
    time = Time.now.strftime("%H:%M")
    day = Time.now.strftime("%d-%m-%Y")

    @attendance = Attendance.create(attendance_date: day, check_in: time, check_out: time, private_num: :private_num)
    if @attendance.save
      redirect_to pages_path
    end
  end
end
