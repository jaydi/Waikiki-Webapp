class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  before_action :load_and_authorize_payment

  def show
  end

  private

  def load_and_authorize_payment
    @payment = Payment.find(params[:id])
    user = User.find(params[:user_id])
    redirect_to root_path unless @payment.sender_id == user.id
    # unless user.user_agreements_accepted?
    #   redirect_to users_agreements_path(user_id: user.id, pending_payment_id: @payment.id, vendor: params[:vendor])
    #   return
    # end
  end

end
