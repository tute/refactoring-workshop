# Tute's approach (after applying the pattern to `app.rb`).
# Tests run here in the same way.

require './setup'

class Subscription
  class Null
    def name; 'none'; end
    def status; '-';  end
    def trial_days; '-'; end
    def cancel
      false
    end
  end
end

class User
  def last_subscription
    subscriptions.last || Subscription::Null.new
  end

  def cancel_subscription
    last_subscription.cancel
  end
end

class StatusReportJob
  def perform
    users = {}
    User.all.map do |user|
      users[user.name] = {
        name: user.last_subscription.name,
        status: user.last_subscription.status,
        trial_days: user.last_subscription.trial_days
      }
    end
    users
  end
end

require './tests' if __FILE__ == $0
