module Admin
  class ProjectsController < BaseController
    before_action :set_project, only: %i[show create edit update]

    def index
      @projects = Project.all
    end

    def show;end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to project_path(@project), notice: 'Projeto salvo com sucesso'
      else
        render :show
      end
    end

    def edit;end

    def update
      @project.update(project_params)
      if @project.save
        redirect_to admin_project_path(@project), notice: 'Projeto editado com sucesso'
      else
        render :edit
      end
    end

    def destroy
      if @project.destroy
        redirect_to admin_projects_path, notice: 'Projeto deletado com sucesso'
      else
        render :index
      end
    end

    private

    def set_project
      @project = Project.new
    end

    def project_params
      params.require(:project).permit(:description, :title)
    end
  end
end
