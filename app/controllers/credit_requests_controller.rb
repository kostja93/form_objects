class CreditRequestsController < ApplicationController
  before_action :find_client

  def new
    @credit_request = CreditRequest.new(client: @client)
  end

  def create
    @credit_request = CreditRequest.new(credit_request_params)

    if @credit_request.save
      redirect_to new_client_client_data_path(client_id: @client.id)
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  def show
    @credit = @client.credit_requests.find(params[:id])
  end

  def index
    @credit_requests = @client.credit_requests
  end

  private

  def find_client
    @client = Client.find(params[:client_id])
  end

  def credit_request_params
    params
      .require(:credit_request)
      .permit(:value, :currency)
      .merge(client: @client)
  end
end
