class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(id: :DESC)
   
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit 
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    unless @item.user == current_user
      redirect_to root_path
    end
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :product_status_id, :delivery_burden_id, :prefectures_id, :shipping_period_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
