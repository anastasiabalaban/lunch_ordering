class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # binding.pry
    @order = current_user.orders.new(order_params)
    @order.items_orders.each { |e| e.price = e.item.price }
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_meal_ids, :main_meal_ids, :drink_ids)
  end
end
