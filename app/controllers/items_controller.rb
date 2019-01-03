class ItemsController < ApplicationController
  before_action :load_item, only: %i[edit update destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def load_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :meal_type)
  end
end
