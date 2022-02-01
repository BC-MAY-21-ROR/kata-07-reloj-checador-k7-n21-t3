class AttendancesController < ApplicationController
  def index
  end

  def new
    @attendance = Attendance.new
    @company = Company.where(disable: false)
  end

  def create
    @employee = Employee.where(disable:false)
    data = params.require(:attendance).permit(:private_num,:company_id)
    time = Time.now.strftime("%H:%M:%S")
    day = Time.now.strftime("%d-%m-%Y")
    emp = @employee.find_by(private_num: data.fetch(:private_num), company_id: data.fetch(:company_id))

    if !emp.nil?
      @all = Attendance.all
      update = @all.find_by(private_num: data.fetch(:private_num), attendance_date: day, check_out: nil)
      if update.nil?
        data[:attendance_date]=day
        data[:check_in]=time
        data.delete(:company_id)
        if Attendance.new(data).save
          redirect_to root_path, success: "Check In Successfully"
        else
          redirect_to root_path
        end
      else
        if update.update(check_out: time)
          redirect_to root_path, success: "Check Out Successfully"
        else
          redirect_to root_path
        end
      end
    else
      redirect_to root_path, danger: "Private Number or Company are wrong"
    end
  end
end
