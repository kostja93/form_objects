class ClientNamesController < ApplicationController
  def new
    @client_name = ClientName.new
  end

  def create
    @client_name = ClientName.new(params.require(:client_name).permit(:first_name, :last_name))

    if @client = @client_name.save
      redirect_to new_client_credit_request_path(client_id: @client.id)
    else
      flash[:alert] = 'It is mendotory to enter your name'
      render :new
    end
  end
end
