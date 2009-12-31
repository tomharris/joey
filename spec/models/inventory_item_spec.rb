require 'spec_helper'

describe InventoryItem do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:inventory_item)
  end

  it "should create a new instance given valid attributes" do
    InventoryItem.create!(@valid_attributes)
  end
end
