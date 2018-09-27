class SchedulesController < ApplicationController
    before_action :authenticate_user!

    def index
        @schedules = Schedule.all
        @users = User.all
        @boats = Boat.all
    end

    def show 
        @schedule = Schedule.find(params[:id])
    end

    def new
        @schedule = Schedule.new
        @boats = Boat.all
        @jobs = Job.all
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def create 
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            redirect_to "/schedules"
        else
            render "/schedules/new"
        end
    end

    def destroy 
        schedule = Schedule.find(params[:id])
        schedule.destroy
        redirect_to schedules_path
    end

    def update
        @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to "/jobs"
    else
      render "/jobs/new"
    end
  end

    private
    def schedule_params
        params.require(:schedule).permit(:boat_id, :job_id, :start, :finish)
    end
end



