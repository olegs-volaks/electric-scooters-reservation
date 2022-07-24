class EmployeesController < ApplicationController

  before_action :set_employee, only: [:destroy, :edit, :update]

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
      redirect_to employees_path, status: :see_other, success: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, status: :see_other, success: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, status: :see_other, success: t('.success')
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
