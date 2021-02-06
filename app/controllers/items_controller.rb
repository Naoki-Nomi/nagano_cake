class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @tax_price = (@item.price * 1.08).round(0)
    @tax_price = @tax_price.to_s(:delimited, delimiter: ',')
  end

end
