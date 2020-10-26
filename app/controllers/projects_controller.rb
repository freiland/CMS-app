class ProjectsController < ApplicationController
  before_action except: [:index, :show] do 
    unless is_admin?
      flash[:alert] = 'You do not have access to this content.'
      redirect_to projects_path 
      end
  end
  
  def index
    @projects = Project.all
    render :index
  end

  def new
    @roject = Project.new
    render :new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  def update
    @project= Project.find(params[:id])
    if @projec.update(projec_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:post).permit(:name, :author)
    end

  end