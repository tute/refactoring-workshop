class User < Struct.new(:created_at)
  def active_projects
    [:user_active_projects]
  end
end

class Project
  def self.featured
    [:public_featured_projects]
  end
end

class ProjectsController
  attr_accessor :current_user, :flash_msg, :projects
end
