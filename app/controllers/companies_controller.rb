class CompaniesController < ApplicationController
  def index
    @company = Company.where(disable: false)
  end
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company).permit(:name, :address))
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(params.require(:company).permit(:name, :address))
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.update(disable: true)
    redirect_to companies_path
  end
end
