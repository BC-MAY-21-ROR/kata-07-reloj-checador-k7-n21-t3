class AbsenceController < ApplicationController

  def absence

    @date = params[:date]
    @employee = Employee.where(disable: false)
    @attendance = Attendance.all

    if !date.nil?
      record_year=Attendance.where('extract(year  from attendance_date) = ?', @date[0..3])
      record_month=record_year.where('extract(month  from attendance_date) = ?', @date[5..6])
      month = @date[5..6]

      case month
      when "1", "3", "5", "7", "8", "10", "12"
        for i in 1..31 do
          @attendance.find_by(private_num: employee.private_num)
        end
      end
       
    else
      @attendance = Attendance.where(attendance_date: Time.now)
    end
    render 'absence'
  end

  def cal_absence(emp)
    absence=0
    case month
    when "1", "3", "5", "7", "8", "10", "12"
      for i in 1..31 do
        @attendance=find_by(attendance_date:@date+"#{i}")
        @attendance.find_by(private_num: emp.private_num) ? absence++ : nil
      end
    end
    return absence
  end
end
