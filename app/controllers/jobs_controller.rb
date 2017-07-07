class JobsController < ApplicationController
  before_action :set_category, only: [:index, :new, :create, :show]
  before_action :set_job, only: [:show]
  
  def index
    @jobs = @category.current_category_jobs.all
  end
  
  def new
    @job = @category.current_category_jobs.build(job_params)
  end

  def create
    @job = @category.current_category_jobs.build(job_params)
    if @job.save
      redirect_to category_jobs_path(@category), notice: "New Job been added successfully!"
    else
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private
  def job_params
    # params.require(:job).permit(:title, :description, :exp_required, :salary, :location, :company_name, :category_id)
    params.fetch(:job, {}).permit(:title, :description, :exp_required, :salary, :location, :company_name, :category_id, :key_skills)
  end
  
  def set_category
    @category = Category.find(params[:category_id])
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end