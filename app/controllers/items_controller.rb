class ItemsController < ApplicationController
  before_action :find_item, only: %i[edit update destroy]
  before_action :check_policy

  def index
    @items = Item.all
  end

  def new
    @item = ::Items::NewCreate.new.new_item
  end

  def create
    @item = ::Items::NewCreate.new(item_params).new_item

    return redirect_to items_path if @item.valid?

    render :new
  end

  def update
    if ::Items::Update.call(item: @item, params: item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    ::Items::Destroy.call(item: @item)

    redirect_to items_path
  end

  private

  def find_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :meal_type)
  end

  def check_policy
    authorize(@item || Item)
  end
end
