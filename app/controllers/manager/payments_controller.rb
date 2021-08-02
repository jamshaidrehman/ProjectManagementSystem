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
        redirect_to @project
      else
        render 'new'
      end
    end

    def destroy
      @payment = Payment.find params[:id]

      @payment.destroy
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
