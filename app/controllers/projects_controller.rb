class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_project, only: [:edit, :update, :show]

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    current_user.projects.create(project_params)
    redirect_to projects_path
  end

  def edit
  end

  def update
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
