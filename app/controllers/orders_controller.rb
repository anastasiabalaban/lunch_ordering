# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = ::Orders::Index.new(current_user).orders
  end

  def new
    @facade = ::Orders::NewCreate.new

    authorize @facade.order
  end

  def create
    @facade = ::Orders::NewCreate.new(current_user, order_params)

    return redirect_to orders_path if @facade.valid?

    render :new
  end

  private

  def order_params
    params.require(:order).permit(:first_meal_ids, :main_meal_ids, :drink_ids)
  end
end
