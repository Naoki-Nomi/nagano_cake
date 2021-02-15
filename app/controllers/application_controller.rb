class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      items_path
    end
  end

  def after_sign_up_path_for(resource)
    items_path
  end


  def set_search
    @search = Customer.ransack(params[:q])
    @search_customers = @search.result.page(params[:page])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end

end
