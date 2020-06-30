class OrdersController < ApplicationController

  def create
    @order = Order.new
    @order.user = current_user
    @subscription = Subscription.find(params[:subscription_id])
    @order.subscription = @subscription
    @order.amount = @subscription.price
    @order.state = 'pending'
    authorize @order
    @order.save!
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @subscription.name,
        amount: @subscription.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
      )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show

    @order = current_user.orders.find(params[:id])

    authorize @order
    @offers = policy_scope(Offer)
    @bookings = current_user.bookings
    @bars = policy_scope(Bar)
    @bars = current_user.bars
    authorize @bookings

    @premium = Order.find(params[:id]).subscription.premium
    current_user.premium = @premium
    current_user.save!
    @sweetalert = true
    render 'dashboards/show'

  end

end
