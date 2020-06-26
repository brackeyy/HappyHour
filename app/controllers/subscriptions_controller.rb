class SubscriptionsController < ApplicationController

  def index
    @subscriptions = policy_scope(Subscription)
    @subscriptions = Subscription.all
  end

end
