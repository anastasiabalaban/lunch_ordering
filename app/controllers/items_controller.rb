class ItemsController < ApplicationController
  before_action :find_item, only: %i[edit update destroy]

  def index
    @items = authorize Item.all
  end

  def new
    @item = authorize ::Items::NewCreate.new.item
  end

  def create
    @item = ::Items::NewCreate.new(item_params).item
    redirect_to items_path if @item.valid?
    render :new if @item.invalid?
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy

    redirect_to items_path
  end

  private

  def find_item
    @item = authorize Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :meal_type)
  end
end
