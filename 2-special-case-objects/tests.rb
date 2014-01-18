require 'minitest/autorun'
require_relative 'app'

class TestApp < Minitest::Test
  def test_status_report_job
    response = {
      "Bob" => { name: "Monthly Subscription", status: "active", trial_days: 14},
      "Patricio" => { name: "none", status: "-", trial_days: "-"}
    }
    assert_equal response, StatusReportJob.new.perform
  end

  def test_subscription_cancel
    user = User.all.first
    assert user.cancel_subscription

    user = User.all.last
    assert !user.cancel_subscription
  end
end
