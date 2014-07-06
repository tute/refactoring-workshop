require_relative 'setup'

class ProjectsController
  def index
    # When user is admitted at least a week ago we show it's active projects
    if current_user && current_user.created_at < (Time.now - 7*24*3600)
      @projects = current_user.active_projects

    # If not admitted we show some featured projects, and set a marketing flash
    # message when user is new
    else
      if current_user && current_user.created_at > (Time.now - 7*24*3600)
        @flash_msg = 'Sign up for having your own projects, and see promo ones!'
      end
      @projects = Project.featured
    end
  end
end
