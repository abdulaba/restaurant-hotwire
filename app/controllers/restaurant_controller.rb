class RestaurantController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurant = Restaurant.order_by_created
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "El restaurante se creó correctamente"
    else
      render :new, status: :unprocessable_entity, alert: "Hubo un error al crear el restaurante"
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: "El restaurante se editó correctamente"
    else
      render :edit, status: :unprocessable_entity, alert: "Hubo un error al crear el restaurante"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
