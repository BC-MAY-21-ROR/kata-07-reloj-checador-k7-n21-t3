class AttendancesController < ApplicationController
  def index
  end

  def new
    @attendance = Attendance.new
    @company = Company.enabled
  end

  def create
    @employee = Employee.enabled
    data = params.require(:attendance).permit(:private_num, :company_id)
    data[:check_in] = Time.now.strftime("%H:%M:%S")
    data[:attendance_date] = Time.now.strftime("%d-%m-%Y")
    emp = Employee.enabled.find_by(data.slice(:private_num, :company_id))
    if !emp.nil?
      update_check(data)
    else
      redirect_to root_path, danger: "Private Number or Company are wrong"
    end
  end

  def update_check(data)
    update = Attendance.find_by(private_num: data.fetch(:private_num), attendance_date: data.fetch(:attendance_date), check_out: nil)
    if update.nil?
      create_check(data)
    else
      if update.update(check_out: data.fetch(:check_in))
        redirect_to root_path, success: "Check Out Successfully"
      else
        redirect_to root_path, danger: "Error at making Check Out"
      end
    end
  end

  def create_check(data)
    data.delete(:company_id)
    if Attendance.create(data)
      redirect_to root_path, success: "Check In Successfully"
    else
      redirect_to root_path, danger: "Error at making Check In"
    end
  end
end
