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
    if @restaurant.save
    # (if it saves correctly to the database)
      redirect_to restaurant_path(@restaurant)   # to show_path(+id)=>routers
    # redirect to product page by using dynamic path (from router/incl. id)
    else
      render :new
      # (i.e. show the form again with the error messages)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def review
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.review
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :rating)
  end
end
