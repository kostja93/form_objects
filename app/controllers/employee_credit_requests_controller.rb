class EmployeeCreditRequestsController < ApplicationController
  def index
    @credit_requests = CreditRequest.all
  end

  def new
  end

  def create
  end
end
