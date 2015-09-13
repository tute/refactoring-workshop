require_relative 'setup'

class User
  def last_subscription
    subscriptions.last || NoSubscription.new
  end

  def cancel_subscription
    last_subscription.cancel
  end
end

class NoSubscription
  def name
    "none"
  end

  def trial_days
    "-"
  end

  def status
    "-"
  end

  def cancel
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
