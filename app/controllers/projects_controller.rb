class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @graph = graph
  end

  def new
    @project = Project.new
  end

  def create
    current_user.projects.create(project_params)
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def graph
    @project.sprints.map {|sprint| [sprint.created_at.strftime("%d %b %y"),
                                    sprint.role_rating, sprint.role_rating(false), 
                                    sprint.rating, sprint.reviews.count.to_s,
                                    sprint.description]}
  end
end
