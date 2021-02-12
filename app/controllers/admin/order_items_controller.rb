class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_path(@order_item.order.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :amount, :price).merge(making_status: params[:order_item][:making_status].to_i)
  end

end
