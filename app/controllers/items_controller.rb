# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_item, only: %i[edit update destroy]
  before_action :check_policy

  def index
    @facade = ::Items::Index.new
  end

  def new
    @item = ::Items::Create.call
  end

  def create
    @item = ::Items::Create.call(item_params)

    return redirect_to items_path if @item.valid?

    render :new
  end

  def update
    @item_updated = ::Items::Update.call(item: @item, params: item_params)

    return redirect_to items_path if @item_updated

    render :edit
  end

  def destroy
    ::Items::Destroy.call(item: @item)

    redirect_to items_path
  end

  private

  def find_item
    @item = Item.find_by(id: params[:id]) || not_found
  end

  def item_params
    params.require(:item).permit(:name, :meal_type)
  end

  def check_policy
    authorize(@item || Item)
  end
end
