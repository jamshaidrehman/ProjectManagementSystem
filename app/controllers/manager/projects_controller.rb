module Manager
  class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :update, :destroy, :edit]
    before_action :authenticate_user!

    def index
      @projects = Project.order(created_at: :desc)
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        flash[:notice] = "Your Project is successfully created"
        redirect_to manager_project_path(@project)
      else
        render 'new'
      end
    end

    def update
      if @project.update project_params
        flash[:notice] = "Your Project is successfully updated"
        redirect_to manager_project_path
      else
        render 'new'
      end
    end

    def show; end

    def edit; end

    def destroy
      @project.destroy
      flash[:notice] = "Your Project is successfully deleted"

      redirect_to manager_projects_path
    end

    private

    def project_params
      params.require(:project).permit(:title, :description, :client_id, :file)
    end

    def find_project
      @project = Project.find params[:id]
    end

  end
end
