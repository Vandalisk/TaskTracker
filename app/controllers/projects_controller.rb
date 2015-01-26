class ProjectsController < ApplicationController	
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :get_project, only: [:show, :edit, :update, :destroy]

  def get_project
	@project = Project.find(params[:id])
  end

  def index
	@projects = Project.all		
  end

  def show
	redirect_to project_tasks_path(@project)			
  end

  def new
	@project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

	if @project.save
	  redirect_to projects_path
	else			
	  render 'new'
	end
  end

  def update	    
    if(@project.update_attributes(project_params))
      redirect_to projects_path
	else
	  render 'edit'
	end	   
  end

  def destroy		
	@project.destroy

	redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title)
	end
end
