class MenusController < ApplicationController
  def index
    @menus = Menu.all.decorate
  end

  def show
    @facade = ::Menus::Show.new(params[:id])
  end

  def new
    @menu = authorize ::Menus::NewCreate.new.new_menu
  end

  def create
    @menu = ::Menus::NewCreate.new(menu_params).new_menu

    return redirect_to root_path if @menu.valid?

    render :new
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
