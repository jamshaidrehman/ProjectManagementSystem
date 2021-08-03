module Manager
  class ClientsController < ApplicationController
    
    before_action :find_client, only: [:show, :update, :edit, :destroy]
    before_action :authenticate_user!, except: [:show, :index]
    
    def index
      @clients = Client.order(created_at: :desc)
    end

    def new
      @client = Client.new
    end

    def create
      @client = Client.new(client_params)

      if @client.save
        flash[:notice] = "Your Client is successfully created"
        redirect_to manager_client_path(@client)
      else
        render 'new'
      end
    end

    def update
      if @client.update client_params
        flash[:notice] = "Your Client is successfully updated"
        redirect_to manager_client_path(@client)
      else
        render 'edit'
      end
    end

    def show; end

    def edit; end

    def destroy
      @client.destroy
      flash[:notice] = "Your Client is successfully deleted"

      redirect_to root_path
    end

    private

    def client_params
      params.require(:client).permit(:name, :email, :contact, :address)
    end

    def find_client
      @client = Client.find params[:id]
    end
  end
end
