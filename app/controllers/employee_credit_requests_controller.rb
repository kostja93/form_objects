class EmployeeCreditRequestsController < ApplicationController
  def index
    @credit_requests = CreditRequest.all
  end

  def new
    @employee_credit_request = EmployeeCreditRequest.new
  end

  def create
    @employee_credit_request = EmployeeCreditRequest.new(employee_credit_request_params)

    if @employee_credit_request.save
      flash[:notice] = 'Credit Request successfully created'
      redirect_to employee_credit_requests_path
    else
      flash[:alert] = 'Something went wrong creating a Credit Request'
      render :new
    end
  end

  private

  def employee_credit_request_params
    params.require(:employee_credit_request).permit(EmployeeCreditRequest.new.attributes.keys)
  end
end
