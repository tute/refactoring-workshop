require './setup'

class User
  def last_subscription
    subscriptions.last
  end

  def cancel_subscription
    last_subscription && last_subscription.cancel
  end
end

class StatusReportJob
  def self.perform
    users = {}
    User.all.map do |user|
      users[user.name] = {
        name: (user.last_subscription && user.last_subscription.name) || 'none',
        status: (user.last_subscription && user.last_subscription.status) || '-',
        trial_days: user.last_subscription && user.last_subscription.trial_days || '-'
      }
    end
    users
  end
end

require './tests' if __FILE__ == $0
