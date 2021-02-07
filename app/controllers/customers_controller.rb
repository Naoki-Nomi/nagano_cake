class CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_mypage_path(current_customer.id)
  end

  def confirm
    @customer = Customer.find(current_customer.id)
  end

  def quit
    customer = Customer.find(current_customer.id)
    customer.is_deleted = false
    redirect_to customers_mypage_path(current_customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted, :email)
  end


end
