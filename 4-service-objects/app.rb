require_relative 'setup'

class User
  attr_accessor :subscription

  # validations
  # callbacks
  # authentication logic
  # notifications logic

  def subscribe
    api_result = try_api { PaymentGateway.subscribe }
    if api_result == :success
      self.subscription = :monthly_plan
    end
    api_result
  end

  def unsubscribe
    api_result = try_api { PaymentGateway.unsubscribe }
    if api_result == :success
      self.subscription = nil
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

  # Other private methods
end
