class EmployeesController < ApplicationController
  def index
    @employee = Employee.where(disable: false)
    @company = Company.where(disable: true)
    @employee.each do |employee|
      @company.each do |company|
        employee.update(disable: true) if employee.company_id == company.id
      end
    end
  end

  def new
    @employee = Employee.new
    @company = Company.where(disable: false)
  end

  def create
    @employee = Employee.new(params.require(:employee).permit(:name, :email, :position, :employee_num, :private_num, :company_id))
    if @employee.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(params.require(:employee).permit(:name, :email, :position, :employee_num, :private_num, :company_id))
      redirect_to employees_path
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.update(disable: true)
    redirect_to employees_path
  end
end
