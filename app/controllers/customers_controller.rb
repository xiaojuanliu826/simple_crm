class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.order(:full_name)
    render :index
  end

  def missing_email
    @customers = Customer.where(email_address: [nil, ""])
    render :index # 同样复用 index 的视图
  end
end
