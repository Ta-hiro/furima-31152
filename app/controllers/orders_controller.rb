class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :direct

  def index
    @buy = BuyForm.new
    if @item.user == current_user
      redirect_to root_path 
    end
  end

  def create
    @buy = BuyForm.new(buy_params)
    if @buy.valid?
      pay_processing
      @buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_form).permit(:postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number)
          .merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_processing
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,     # 商品の値段
      card: buy_params[:token],       # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def direct
    redirect_to root_path if request.referer.nil?
  end
end
