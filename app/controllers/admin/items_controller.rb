class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_root_path
    else
      @items = Item.all
      render :index
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price = @item.price.to_s(:delimited, delimiter: ',')
    @tax_price = (@item.price * 1.08).round(0)
    @tax_price = @tax_price.to_s(:delimited, delimiter: ',')
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end

end
