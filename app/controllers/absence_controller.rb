class AbsenceController < ApplicationController

  helper_method :cal_absence
  def absence

    @date = params[:date]
    @employee = Employee.where(disable: false)
    @attendance = Attendance.all

    if !@date.nil?
      @month = @date[5..6].to_s
      record_year=Attendance.where('extract(year  from attendance_date) = ?', @date[0..3])
      record_month=record_year.where('extract(month  from attendance_date) = ?', @date[5..6])
      case @month
        when "1", "3", "5", "7", "8", "10", "12"
          for i in 1..31 do
            @attendance.find_by(private_num: employee.private_num)
          end
      end
    else
      @date = Time.now.strftime("%Y-%m")
      @month = @date[5..6].to_s
    end
      render 'absence'
  end

  def cal_absence(emp)
    absence=0
    case @month
    when "02"
      for i in (1..28) do
        att = @attendance.find_by(attendance_date:@date+"-#{i}", private_num: emp.private_num)
        if att.nil?
          absence+=1
        end
      end
    when "04", "06", "09", "11"
      for i in (1..30) do
        att = @attendance.find_by(attendance_date:@date+"-#{i}", private_num: emp.private_num)
        if att.nil?
          absence+=1
        end
      end
    else
      for i in (1..31) do
        att = @attendance.find_by(attendance_date:@date+"-#{i}", private_num: emp.private_num)
        if att.nil?
          absence+=1
        end
      end
    end
    absence
  end
end
