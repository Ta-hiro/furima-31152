class OrdersController < ApplicationController

  def index
    @buy = BuyForm.new
    @item = Item.find(params[:item_id])
  
  end

  def create
    @buy = BuyForm.new(buy_params)
    if @buy.save
      redirect_to root_path
    else
      render "order#index"
    end
  end
  
  private 
  def buy_params
  params.require(:buy_form).permit(:postal_code, :prefectures_id, :city,
    :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
