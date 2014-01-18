# Tute's approach (after applying the pattern to `app.rb`).
# Tests run here in the same way.

require './setup'

class SubscriptionService < Struct.new(:user)
  def subscribe
    api_result = try_api { PaymentGateway.subscribe }
    if api_result == :success
      user.subscription = :monthly_plan
    end
    api_result
  end

  def unsubscribe
    api_result = try_api { PaymentGateway.unsubscribe }
    if api_result == :success
      user.subscription = nil
    end
    api_result
  end

  private

  # Try API connection, trap and log it on failures
  def try_api
    yield
  rescue SystemCallError => e
    # log API connection failure
    :network_error
  end
end

class User
  attr_accessor :subscription

  # validations
  # callbacks
  # authentication logic
  # notifications logic

  # Podría ser delegate :subscribe, :unsubscribe, to: :subscription_service

  def subscribe
    subscription_service.subscribe
  end

  def unsubscribe
    subscription_service.unsubscribe
  end

  private

  def subscription_service
    @subscription_service ||= SubscriptionService.new(self)
  end
end

require './tests' if __FILE__ == $0
