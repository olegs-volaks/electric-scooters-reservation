class ScootersController < ApplicationController

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
      redirect_to scooters_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scooter_params
    params.require(:scooter).permit(:number)
  end
end
