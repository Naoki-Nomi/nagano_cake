# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.is_deleted == "退会済み"
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    end
  end

end
