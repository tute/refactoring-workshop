require File.expand_path('../../2-special-case-objects/app.rb', __FILE__)


describe StatusReportJob do
  let(:response) do
    {
    "Bob" => { name: "Monthly Subscription", status: "active", trial_days: 14},
    "Patricio" => { name: "none", status: "-", trial_days: "-"}
    }
  end
  it { StatusReportJob.new.perform.should == response }
end

describe User do
  describe "#cancel_subscription" do
    context "when user has subscription" do
      let(:user) { User.all.first }
      it { user.cancel_subscription.should == true }
    end
    context "when user has no subscription" do
      let(:user) { User.all.last }
      it { !user.cancel_subscription.should == true }
    end
  end
end
