# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :check_policy

  def index
    @facade = ::Menus::Index.new(current_user)
  end

  def show
    @facade = ::Menus::Show.new(params)
  end

  def new
    @facade = ::Menus::NewCreate.new
  end

  def create
    @facade = ::Menus::NewCreate.new(menu_params)

    return redirect_to root_path if @facade.valid?

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

  def check_policy
    authorize(@facade || Menu)
  end
end
