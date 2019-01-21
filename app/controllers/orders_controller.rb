# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @facade = ::Orders::NewCreate.new

    authorize @facade.order
  end

  def create
    @order = ::Orders::NewCreate.new(current_user, order_params)

    return redirect_to root_path if @order.order.valid?

    render :new
  end

  private

  def order_params
    params.require(:order).permit(:first_meal_ids, :main_meal_ids, :drink_ids)
  end
end
