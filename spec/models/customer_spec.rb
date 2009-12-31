require 'spec_helper'

describe Customer do

  before(:each) do
    @valid_attributes = Factory.attributes_for(:customer)
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  describe "#full_name" do

    it "should return the first and last name in a string" do
      customer = Factory(:customer, :first_name => "test", :last_name => "user")
      customer.full_name.should == "test user"
    end

  end

end
