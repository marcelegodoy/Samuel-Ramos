module Admin
  class ProjectsController < BaseController
    def index
      @projects = Project.all
    end
  end
end
