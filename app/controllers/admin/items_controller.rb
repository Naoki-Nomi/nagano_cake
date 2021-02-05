class Admin::ItemsController < ApplicationController

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

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end

end
