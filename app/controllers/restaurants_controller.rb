class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # @restaurant = Restaurant.new(params[:restaurant]) # != security
    @restaurant = Restaurant.new(restaurant_params)    # = security
    @restaurant.save
    redirect_to restaurant_path(@restaurant)   # to show_path(+id)=>routers
    # redirect to product page by using dynamic path (from router/incl. id)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :rating)
  end
end
