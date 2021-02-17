class ItemsController < ApplicationController
  before_action :item_search

  def index
    @items = Item.page(params[:page])
    @genres = Genre.all

    if params[:q]
      @search_items = @ransack.result.page(params[:page])
    elsif params[:p]
      @search_items = @ransack2.result.page(params[:page])
      @select_genre = Genre.find_by(id: params[:p].values)
    end
  end

  def item_search
    @ransack = Item.ransack(params[:q])
    @search_items = @ransack.result.page(params[:page])

    @ransack2 = Item.ransack(params[:p], search_key: :p)
    @genres = Genre.all
    @search_items = @ransack2.result.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @tax_price = (@item.price * 1.08).round(0)
    @tax_price = @tax_price.to_s(:delimited, delimiter: ',')

    @cart_item = CartItem.new

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def search_params
    params.require(:p).permit(:genre_id_eq)
  end

end
