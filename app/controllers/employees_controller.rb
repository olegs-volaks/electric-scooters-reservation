class EmployeesController < ApplicationController

  def index
    @q = Employee.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @employees = @q.result.paginate(page: params[:page])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email)
  end
end
