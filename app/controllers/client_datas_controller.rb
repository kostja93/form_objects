class ClientDatasController < ApplicationController
  def new
    @client_data = ClientData.new
  end

  def create
    @client_data = ClientData.new(client_data_params)

    if @client_data.save
      flash[:notice] = 'Your Request will be reviewed, we will get back to you'
      redirect_to client_credit_request_path(CreditRequest.last, client_id: params[:client_id])
    else
      flash[:alert] = 'Upsy'
      render :new
    end
  end

  private

  def client_data_params
    params
      .require(:client_data)
      .permit(ClientData.new.attributes.keys)
      .merge(id: params[:client_id])
  end
end
