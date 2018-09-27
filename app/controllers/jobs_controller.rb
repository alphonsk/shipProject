class JobsController < ApplicationController
  before_action :authenticate_user!
  
   # GET /jobs
   def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to "/jobs"
    else
      render "/jobs/new"
    end
end

  # PATCH/PUT /jobs/1
  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      redirect_to "/jobs"
    else
      render "/jobs/new"
    end
  end

  # DELETE /jobs/1
  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
  end
end
