class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    case params[:order_sort]

    when "0"
      @orders = Order.page(params[:page])
    when "1"
      @customer = Customer.find(params[:id])
      @orders = @customer.orders.page(params[:page])
    else
      @orders = Order.page(params[:page])
    end
  end

end
