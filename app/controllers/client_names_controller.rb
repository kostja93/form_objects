class ClientNamesController < ApplicationController
  def new
    @client_name = ClientName.new
  end

  def create
    @client_name = ClientName.new(params.require(:client_name).permit(:first_name, :last_name))

    if @client_name.save
      redirect_to employee_credit_requests_path
    else
      flash[:alert] = 'It is mendotory to enter your name'
      render :new
    end
  end
end
