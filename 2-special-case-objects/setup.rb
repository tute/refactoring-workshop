class Subscription
  def name
    'Monthly Subscription'
  end
  def status
    'active'
  end
  def trial_days
    14
  end
  def cancel
    # telling payment gateway...
    true
  end
end

class User
  attr_accessor :name, :subscriptions

  def initialize(options = {})
    options.each { |k, v| send("#{k}=", v) }
  end

  def self.all
    suscripto = User.new(name: 'Bob', subscriptions: [Subscription.new])
    no_suscripto = User.new(name: 'Patricio', subscriptions: [])
    [suscripto, no_suscripto]
  end
end
