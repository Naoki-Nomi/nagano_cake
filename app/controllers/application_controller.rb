class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  #Adminは、顧客の名前でヘッダー上で検索可能。ransackで搭載。

  def set_search
    @search = Customer.ransack(params[:q])
    @search_customers = @search.result.page(params[:page])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  private

  #サインイン後、Adminは注文履歴一覧にリダイレクトする

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path(:order_sort => 0)
    when Customer
      root_path
    end
  end

  #サインアウト後、Adminはサインイン画面にリダイレクトする

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :customer
      root_path
    else
      root_path
    end
  end

end
