require  'spec_helper'
require File.expand_path('../../1-intention-revealing-method/app.rb', __FILE__)

describe ProjectsController do

  describe "index" do
    before do
      @controller = ProjectsController.new
      @admitted_user = User.new(Time.new(2013, 11, 10))
      @new_user = User.new(Time.new)
    end
    context "when admitted users" do
      before do
        @controller.current_user = @admitted_user
        @controller.index
      end
      it { [:user_active_projects].should == @controller.projects }
      it { @controller.flash_msg.should be_nil }
    end

    context "when new user" do
      before do
        @controller.current_user = @new_user
        @controller.index
      end
      it { [:public_featured_projects].should == @controller.projects }
      it { @controller.flash_msg.should == 'Sign up for having your own projects, and see promo ones!' }
    end
  end
end
