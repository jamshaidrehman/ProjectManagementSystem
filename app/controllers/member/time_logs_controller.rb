module Member
  class TimeLogsController < BaseController
    before_action :find_log, only: %i[show update edit destroy]
    before_action :authenticate_user!

    def index
      @logs = TimeLog.order(created_at: :desc)
    end

    def new
      @log = TimeLog.new
    end

    def create
      @log = TimeLog.new(log_params)

      if @log.save
        flash[:notice] = "Your Time Log is successfully created."

        redirect_to member_time_log_path(@log)
      else
        render 'new'
      end
    end

    def show; end

    def edit; end

    def update
      if @log.update log_params
        flash[:notice] = "Your Time Log is successfully updated."

        redirect_to member_time_log_path
      else
        render 'edit'
      end
    end

    def destroy
      if @log.destroy
        flash[:notice] = "Your Time Log is successfully deleted."
      else
        flash[:notice] = @log.errors.full_messages.to_sentence
      end

      redirect_to member_time_logs_path
    end

    private

    def log_params
      params.require(:time_log).permit(:start_time, :end_time, :project_id)
    end

    def find_log
      @log = TimeLog.find params[:id]
    end
  end
end
