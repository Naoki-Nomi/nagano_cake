class Admin::HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    case params[:order_sort]

    when "0"
      @orders = Order.all
    when "1"
      @customer = Customer.find(params[:id])
      @orders = @customer.orders
    else
      @orders = Order.all
    end
  end

end
