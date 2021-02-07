class AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
    p @addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    if address.save
      redirect_to addresses_path
    else
      @address = Address.new
      @addresses = Address.all
      render 'index'
    end
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Adreess.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end