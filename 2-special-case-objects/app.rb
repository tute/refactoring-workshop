require_relative 'setup'

class User
  def last_subscription
    subscriptions.last
  end

  def cancel_subscription
    if last_subscription
      last_subscription.cancel
    end
  end
end

class StatusReportJob
  def perform
    users = {}
    User.all.map do |user|
      users[user.name] = {
        name: last_name(user),
        status: last_status(user),
        trial_days: last_trial_days(user)
      }
    end
    users
  end

  private

  def last_name(user)
    if user.last_subscription && user.last_subscription.respond_to?(:name)
      user.last_subscription.name
    else
      'none'
    end
  end

  def last_status(user)
    if user.last_subscription && user.last_subscription.respond_to?(:status)
      user.last_subscription.status
    else
      '-'
    end
  end

  def last_trial_days(user)
    if user.last_subscription && user.last_subscription.respond_to?(:trial_days)
      user.last_subscription.trial_days
    else
      '-'
    end
  end
end
