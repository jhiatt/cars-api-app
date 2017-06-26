class Api::V2::CarsController < ApplicationController
  def index
    @cars = Car.all
    render "index.json.jbuilder"
  end

  def show
    @car = Car.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @car = Car.new(vin: params[:vin],
                      manufacture: params[:manufacture])
    if @car.save
      render "show.json.jbuilder"
    else
      puts "FAIL!!"
      render json: { errors: @car.errors.full_messages }, status: 422
    end
  end

  def update
    @car = Car.find_by(id: params[:id])
    @car.update(vin: params[:vin],
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
