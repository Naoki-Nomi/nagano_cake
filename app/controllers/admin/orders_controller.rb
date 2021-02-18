class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    @order_unit_price = @order_items.all.sum(:price)

  end

  def update
    order = Order.find(params[:id])
    order_items = OrderItem.where(order_id: order.id)
    if order.update(order_params)
      if order.status == "入金確認"
        order_items.update(making_status: "製作待ち")
      end
    end

    redirect_to admin_path(order.id)
  end

  private

  def order_params
    params.require(:order).permit(:delivery_postal_code, :delivery_address, :delivery_name, :postage, :charge, :payment_method, :customer_id, :status)
  end

end
