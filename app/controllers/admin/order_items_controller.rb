class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    order = Order.find_by(id: order_item.order_id)
    if order_item.update(order_item_params)
      if order_item.making_status == "製作中"
        order.update(status: "製作中")
      elsif order_item.making_status == "製作完了"
        order.update(status: "発送準備中")
      end
    end

    redirect_to admin_path(order_item.order.id)


  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :amount, :price, :making_status)
  end

end
