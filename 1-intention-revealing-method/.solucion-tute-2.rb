require_relative 'setup'

# Intention Revealing Method
# Extract relevant concepts into methods or variables with proper names
# Code should explain itself

class ProjectsController
  def index
    if user_is_admitted_at_least_a_week_ago?
      @projects = current_user.active_projects

    else
      if user_is_new?
        show_marketing_flash_message
      end

      @projects = Project.featured
    end
  end

  private

  def user_is_new?
    current_user && current_user.created_at > a_week_ago
  end

  def user_is_admitted_at_least_a_week_ago?
    current_user && current_user.created_at < a_week_ago
  end

  def show_marketing_flash_message
    @flash_msg = 'Sign up for having your own projects, and see promo ones!'
  end

  def a_week_ago
    Time.now - 7*24*3600
  end
end
