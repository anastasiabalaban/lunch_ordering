class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find_by(id: params[:id])
    @items = @menu.items
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name,
      meals_attributes: [:id, :_destroy, :item_id, 
      item_attributes: [:id, :name, :meal_type, :price, :_destroy]])
  end
end
