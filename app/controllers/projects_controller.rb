class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_project, only: %i[show]

  def index
    @projects = Project.all
  end

  def show;end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:description, :title, images: [])
  end
end
