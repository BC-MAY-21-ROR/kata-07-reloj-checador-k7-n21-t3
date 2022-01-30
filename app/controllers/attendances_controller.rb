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
    day = Time.now.strftime("%m-%d-%Y")
    emp = @employee.find_by(private_num: data.fetch(:private_num))
    com = @employee.find_by(company_id: data.fetch(:company_id))
    if emp.nil? and com.nil?
      @all = Attendance.all
      update = @all.find_by(private_num: data.fetch(:private_num), attendance_date: day)
      if update.nil?
        if Attendance.new(attendance_date:day, check_in:time, private_num: data.fetch(:private_num)).save
          redirect_to new_attendances_path
        else
          render 'new'
        end
      else
        update.update(check_out: time)
      end
    end
  end
end

# @employee = Employee.where(disable:false)
#     data = params.require(:attendance).permit(:private_num,:company_id)
#     private_num = data.fetch(:private_num)
#     company_id = data.fetch(:company_id)
#     time = "#{Time.now.strftime('%H')}:#{Time.now.strftime('%M')}:#{Time.now.strftime('%S')}"
#     day = "#{Time.now.strftime('%Y')}-#{Time.now.strftime('%m')}-#{Time.now.strftime('%e')}"
#     verify_check_in = Attendance.find_by(check_out:nil, private_num: private_num)
#     if verify_check_in.nil?
#       if Attendance.create(attendance_date: day, check_in: time, check_out: nil, private_num: private_num).save
#         redirect_to new_attendances_path
#       else
#         render 'new'
#       end
#     else
#       make_check_out = Attendance.find_by(check_out: nil, private_num: private_num)
#       make_check_out = 
