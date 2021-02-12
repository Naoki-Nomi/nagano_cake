class Admin::HomesController < ApplicationController

  def top
    
    @orders = Order.all
    @order_unit_price = @order_items.all.sum(:price)
  end


end
