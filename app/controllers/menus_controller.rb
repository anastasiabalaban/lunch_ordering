class MenusController < ApplicationController
  def index
    @menus = Menu.all.decorate
  end

  def show
    @facade = ::Menus::Show.new(params)
  end

  def new
    @menu = authorize Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(
      :name,
      meals_attributes: [
        :id,
        :_destroy,
        :item_id,
        :price,
        item_attributes: %i[id name meal_type _destroy]
      ]
    )
  end
end
