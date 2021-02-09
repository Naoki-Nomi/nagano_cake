class CartItemsController < ApplicationController

  def create
    #最初にカートアイテムを作成する
    @cart_item = CartItem.new(cart_item_params)

    #findは主キーのみなので、find_byで外部キーのitem_idを検索する
    #存在していなかったらセーブ、すでに存在していたら数量をプラスする
    if current_customer.cart_items.find_by(item_id: @cart_item.item_id).blank?
      @cart_item.customer_id = current_customer.id
      @cart_item.save(cart_item_params)
    else
      @current_customer_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      @current_customer_item.amount += @cart_item.amount
      @current_customer_item.save(cart_item_params)
    end

    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path(current_customer.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path(current_customer.id)
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end


end
