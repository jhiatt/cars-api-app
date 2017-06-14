class CarsController < ApplicationController
  def index
    @cars = Car.all
    render "index.json.jbuilder"
  end

  def show
    @car = Car.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @car = Car.create(vin: params[:vin],
                      manufacture: params[:manufacture],
                      owner_id: Seller.first.id)
    render :show
  end

  def update
    car = Car.find_by(id: params[:id])
    car.update(vin: params[:vin],
                      manufacture: params[:manufacture])

  end

  def destroy
    car = Car.find_by(id: params[:id])
    car.destroy
    @cars = Car.all
    render :index
  end

end
