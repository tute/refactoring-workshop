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

  def initialize(name, subscriptions)
    @name = name
    @subscriptions = subscriptions
  end

  def self.all
    suscripto = User.new('Bob', [Subscription.new])
    no_suscripto = User.new('Patricio', [])
    [suscripto, no_suscripto]
  end
end
