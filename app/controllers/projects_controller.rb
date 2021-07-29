class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy, :edit]
  before_action :find_client

  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @project = @client.projects.new
  end

  def create
    @project = @client.projects.new(project_params)

    if @project.save
      flash[:notice] = "Your Project is successfully created"
      redirect_to client_project_path(@client, @project)
    else
      render 'new'
    end
  end

  def update
    if @project.update project_params
      flash[:notice] = "Your Project is successfully updated"
      redirect_to client_projects_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def destroy
     @project.destroy
      flash[:notice] = "Your Project is successfully deleted"

    redirect_to client_projects_path
  end

  private

  def find_client
    @client = Client.find(params[:client_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :client_id)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
