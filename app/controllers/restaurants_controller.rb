class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.order_by_created
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      respond_to do |format|
        format.html { redirect_to restaurants_path }
        format.turbo_stream { flash.now[:notice] = "El restaurant se ha creado correctamente"}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      respond_to do |format|
        format.html { redirect_to restaurants_path }
        format.turbo_stream { flash.now[:notice] = "El restaurant se ha editado correctamente"}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_path, status: :see_other}
      format.turbo_stream { flash.now[:notice] = "El restaurant se ha eliminado correctamente"}
    end
  end

  def owner
    @restaurants = current_user.restaurants.order_by_created
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
