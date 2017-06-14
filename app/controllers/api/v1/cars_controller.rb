class Api::V1::CarsController < ApplicationController
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
                      manufacture: params[:manufacture])
    render :show
  end

  def destroy
    car = Car.find_by(id: params[:id])
    car.destroy
    @cars = Car.all
    render :index
  end

end
