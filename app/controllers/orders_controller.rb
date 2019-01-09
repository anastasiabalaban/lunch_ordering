class OrdersController < ApplicationController
  def new
    @order = authorize Order.new
    @facade = ::Orders::New.new
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_meal_ids, :main_meal_ids, :drink_ids)
  end
end
