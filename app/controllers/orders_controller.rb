class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: @customer.id)
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @addresses = Address.where(customer_id: @customer.id)
    @cart_items = current_customer.cart_items.all
    @order.postage = 800

    #delivery_optionの値によって条件分岐する

    if params[:order][:delivery_option] == "0"
      session[:delivery_postal_code] = @customer.postal_code
      session[:delivery_address] = @customer.address
      session[:delivery_name] = @customer.last_name + @customer.first_name
      session[:postage] = @order.postage
      session[:charge] = (@order.postage + @customer.for_total_price)
      session[:payment_method] = @order.payment_method
      session[:customer_id] = @customer.id
      session[:status] = 0

    elsif params[:order][:delivery_option] == "1"
      @address_id = params[:order][:order_address].to_i
      @order_address = Address.find_by(id: @address_id)
      session[:delivery_postal_code] = @order_address.postal_code
      session[:delivery_address] = @order_address.address
      session[:delivery_name] = @order_address.name
      session[:postage] = @order.postage
      session[:charge] = (@order.postage + @customer.for_total_price)
      session[:payment_method] = @order.payment_method
      session[:customer_id] = @customer.id
      session[:status] = 0

    elsif params[:order][:delivery_option] == "2"
      session[:delivery_postal_code] = params[:order][:delivery_postal_code]
      session[:delivery_address] = params[:order][:delivery_address]
      session[:delivery_name] = params[:order][:delivery_name]
      session[:postage] = @order.postage
      session[:charge] = (@order.postage + @customer.for_total_price)
      session[:payment_method] = @order.payment_method
      session[:customer_id] = @customer.id
      session[:status] = 0

    end

    render :confirm

  end

  def create
    @cart_items = current_customer.cart_items.all

    @order = Order.create(
      delivery_postal_code: session[:delivery_postal_code],
      delivery_address: session[:delivery_address],
      delivery_name: session[:delivery_name],
      postage: session[:postage],
      charge: session[:charge],
      payment_method: session[:payment_method],
      customer_id: session[:customer_id],
      status: session[:status]
      )
        if @order.save
          @cart_items.each do |cart_item|
            @order_item = @order.order_items.build(order_item_params)
               @order_item.item_id = cart_item.item.id
               @order_item.amount = cart_item.amount
               @order_item.price = cart_item.for_check_price
               @order_item.making_status = 0
               if @order_item.save
                 current_customer.cart_items.destroy_all
               end
          end
        end
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all.includes([order_items: :item])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    @order_unit_price = @order_items.all.sum(:price)
  end

  private

  def order_params
    params.require(:order).permit(:delivery_postal_code, :delivery_address, :delivery_name, :postage, :charge, :payment_method, :status, :customer_id)
  end

  def order_item_params
    params.permit(:item_id, :amount, :price)
  end

end