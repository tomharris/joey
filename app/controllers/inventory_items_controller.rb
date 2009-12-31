class InventoryItemsController < ApplicationController
  before_filter :require_user

  # GET /inventory_items
  def index
    @inventory_items = InventoryItem.all
  end

  # GET /inventory_items/1
  def show
    @inventory_item = InventoryItem.find(params[:id])
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/edit
  def edit
    @inventory_item = InventoryItem.find(params[:id])
  end

  # POST /inventory_items
  def create
    @inventory_item = InventoryItem.new(params[:inventory_item])

    if @inventory_item.save
      flash[:notice] = 'Inventory item was successfully created.'
      redirect_to(:action => :index)
    else
      render(:action => :new)
    end
  end

  # PUT /inventory_items/1
  def update
    @inventory_item = InventoryItem.find(params[:id])

    if @inventory_item.update_attributes(params[:inventory_item])
      flash[:notice] = 'Inventory item was successfully updated.'
      redirect_to(:action => :index)
    else
      render(:action => :edit)
    end
  end

  # DELETE /inventory_items/1
  def destroy
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.destroy

    redirect_to(:action => :index)
  end
end
