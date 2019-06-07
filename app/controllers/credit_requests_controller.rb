class CreditRequestsController < ApplicationController
  before_action :find_client

  def new
    @credit_request = CreditRequest.new(client: @client)
  end

  def create
    @credit_request = CreditRequest.new(credit_request_params)

    if @credit_request.save
      redirect_to employee_credit_requests_path
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
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
