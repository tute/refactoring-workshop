require 'minitest/autorun'
require_relative 'app'

class TestApp < Minitest::Test
  def setup
    @user = User.new
  end

  def test_successful_subscription
    assert_equal @user.subscribe, :success
    assert_equal :monthly_plan, @user.subscription

    assert_equal @user.unsubscribe, :success
    assert_equal nil, @user.subscription
  end

  def test_unsuccessful_subscription
    PaymentGateway.stub :subscribe, :error do
      assert_equal @user.subscribe, :error
    end
    assert_equal nil, @user.subscription
  end

  def test_unsuccessful_unsubscription
    assert_equal @user.subscribe, :success
    assert_equal :monthly_plan, @user.subscription

    PaymentGateway.stub :unsubscribe, :error do
      assert_equal @user.unsubscribe, :error
    end
    assert_equal :monthly_plan, @user.subscription
  end

  def test_network_error_on_subscription
    PaymentGateway.stub :subscribe, ->{ raise SystemCallError.new 'Network Error' } do
      assert_equal @user.subscribe, :network_error
    end
    assert_equal nil, @user.subscription
  end

  def test_network_error_on_unsubscription
    assert_equal @user.subscribe, :success
    assert_equal :monthly_plan, @user.subscription
    PaymentGateway.stub :unsubscribe, ->{ raise SystemCallError.new 'Network Error' } do
      assert_equal @user.unsubscribe, :network_error
    end
    assert_equal :monthly_plan, @user.subscription
  end
end
