require 'minitest/autorun'
require_relative 'app'

class TestProjectsController < Minitest::Test
  def setup
    @controller = ProjectsController.new
    @admitted_user = User.new(created_at: Time.new(2013, 11, 10))
    @new_user = User.new(created_at: Time.new)
  end

  def test_for_admitted_user
    @controller.current_user = @admitted_user
    @controller.index
    assert_equal [:user_active_projects], @controller.projects
    assert_nil @controller.flash_msg
  end

  def test_for_new_user
    @controller.current_user = @new_user
    @controller.index
    assert_equal [:public_featured_projects], @controller.projects
    assert_equal 'Sign up for having your own projects, and see promo ones!', @controller.flash_msg
  end
end
