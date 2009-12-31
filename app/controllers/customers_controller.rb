class CustomersController < ApplicationController
  before_filter :require_user

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  def create
    @customer = Customer.new(params[:customer])

    if @customer.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to(:action => :index)
    else
      render(:action => :new)
    end
  end

  # PUT /customers/1
  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to(:action => :index)
    else
      render(:action => :edit)
    end
  end

  # DELETE /customers/1
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to(:action => :index)
  end
end
