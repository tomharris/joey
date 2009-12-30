class SalesController < ApplicationController
  before_filter :require_user

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.user = current_user

    if @sale.save
      redirect_to :action => :thank_you
    else
      render :action => :new
    end
  end

  def thank_you
  end

end
