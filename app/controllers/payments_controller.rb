class PaymentsController < ApplicationController

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @premium = @order.subscription.premium
    @subscriptions = policy_scope(Subscription)
    @subscriptions = Subscription.all
    authorize @order
  end

end
