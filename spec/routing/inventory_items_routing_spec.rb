require 'spec_helper'

describe InventoryItemsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/inventory_items" }.should route_to(:controller => "inventory_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inventory_items/new" }.should route_to(:controller => "inventory_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inventory_items/1" }.should route_to(:controller => "inventory_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inventory_items/1/edit" }.should route_to(:controller => "inventory_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inventory_items" }.should route_to(:controller => "inventory_items", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/inventory_items/1" }.should route_to(:controller => "inventory_items", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inventory_items/1" }.should route_to(:controller => "inventory_items", :action => "destroy", :id => "1") 
    end
  end
end
