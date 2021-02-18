class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!


  def update
    order_item = OrderItem.find(params[:id])
    order = order_item.order
    order_items = OrderItem.where(order_id: order.id)
    order_item.update(order_item_params)

    if order_item.making_status == "製作中" && order.status != "製作中"
      order.update(status: "製作中")
    end

    if order_items.where(making_status: "製作完了").count == order_items.count
        order.update(status: "発送準備中")
    end

    redirect_to admin_path(order.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :amount, :price, :making_status)
  end

end
