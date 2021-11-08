class BuyersController < ApplicationController
  # before_action :authenticate_user!
  # before_action :image_item, only: [:index, :create]
  # before_action :non_item, only: [:index, :create]

  # def index
  #   @order = Order.new
  # end

  # def create
  #   @order = Order.new(order_params)
  #   if @order.valid?
  #     pay_item
  #     @order.save
  #     redirect_to root_path
  #   else
  #     render 'index'
  #   end
  # end

  # private

  # def order_params
  #   params.require(:order).permit(:post_number, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
  #     user_id: current_user.id, item_id: params[:item_id], token: params[:token]
  #   )
  # end

  # def image_item
  #   @item = Item.find(params[:item_id])
  # end

  # def pay_item
  #   Payjp.api
  # end
end