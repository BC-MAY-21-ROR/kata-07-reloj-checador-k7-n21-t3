class CompaniesController < ApplicationController
  def index
    @company = Company.all
  end
  def new
  end

  def create
  end
end
