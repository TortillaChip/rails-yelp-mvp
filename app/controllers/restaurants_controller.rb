class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurants_params)

    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
