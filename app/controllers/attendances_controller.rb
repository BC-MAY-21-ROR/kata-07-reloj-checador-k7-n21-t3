class AttendancesController < ApplicationController
  def index
    @attendance = attendance.new
  end

  def create
  end
end
