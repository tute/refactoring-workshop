# Tute's approach (after applying the pattern to `app.rb`).
# Tests run here in the same way.

require './setup'

class ProjectsController
  def index
    if user_admitted?
      @projects = current_user.active_projects
    else
      set_flash_msg_if_new_user
      @projects = Project.featured
    end
  end

  private

  def set_flash_msg_if_new_user
    @flash_msg = 'Sign up for having your own projects, and see promo ones!'
  end

  def user_admitted?
    current_user && current_user.created_at < weeks_ago(1)
  end

  def weeks_ago(n)
    Time.now - n * 7*24*3600
  end
end


# Run tests if running as script
require './tests' if __FILE__ == $0
