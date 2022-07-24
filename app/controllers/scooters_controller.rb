class ScootersController < ApplicationController

  before_action :set_scooter, only: [:destroy, :edit, :update]

  def index
    @q = Scooter.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @scooters = @q.result.paginate(page: params[:page])
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    if @scooter.save
      redirect_to scooters_path, status: :see_other, success: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @scooter.update(scooter_params)
      redirect_to scooters_path, status: :see_other, success: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @scooter.destroy
    redirect_to scooters_path, status: :see_other, success: t('.success')
  end

  private

  def scooter_params
    params.require(:scooter).permit(:number)
  end

  def set_scooter
    @scooter = Scooter.find(params[:id])
  end
end
