require  'spec_helper'
require File.expand_path('../../4-service-objects/app.rb', __FILE__)

describe User do
  let(:user) { User.new }
  describe "#subcribe" do
    context "when successful" do
      before { user.subscribe }
      it { user.subscribe.should == :success}
      it { user.subscription.should == :monthly_plan}
    end

    context "when unsuccessful" do
      before do
        PaymentGateway.stub(:subscribe) { :error }
      end
      it { user.subscribe.should == :error }
      it { user.subscription.should == nil }
    end

    context "when network error" do
      before { PaymentGateway.stub(:subscribe) { raise SystemCallError.new 'Network Error' } }
      it { user.subscribe.should == :network_error }
      it { user.subscription.should == nil }
    end
  end

  describe "#unsubscribe" do
    context "when successful" do
      before { user.unsubscribe }
      it { user.unsubscribe.should == :success }
      it { user.subscription.should == nil }
    end

    context "when unsuccessful" do
      before do
        user.subscribe
        PaymentGateway.stub(:unsubscribe) { :error }
      end
      it { user.unsubscribe.should == :error }
      it { user.subscription.should == :monthly_plan}
    end

    context "when network error" do
      before do 
        PaymentGateway.stub(:unsubscribe) { raise SystemCallError.new 'Network Error' }
        user.subscribe
      end
      it { user.unsubscribe.should == :network_error }
      it { user.subscription.should == :monthly_plan }
    end
  end
end