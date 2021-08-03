module Manager
  class PaymentsController < ApplicationController
    before_action :find_project
    before_action :authenticate_user!

    def new
      @payment = @project.payments.new
    end

    def create
      @payment = @project.payments.new(payment_params)

      if @payment.save
        flash[:notice] = "Your Payment is successfully Add."

        redirect_to manager_project_path(@project)
      else
        render 'new'
      end
    end

    def destroy
      @payment = Payment.find params[:id]

      if @payment.destroy
        flash[:notice] = "Your Payment is successfully deleted."
      else
        flash[:error] = @payment.errors.full_messages.to_sentence
      end

      redirect_to manager_project_path(@project)
    end

    private
    
    def payment_params
      params.require(:payment).permit(:amount, :project_id)
    end

    def find_project
      @project = Project.find params[:project_id]
    end
  end
end
