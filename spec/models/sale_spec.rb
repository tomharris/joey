require 'spec_helper'

describe Sale do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:sale)
  end

  it "should create a new instance given valid attributes" do
    Sale.create!(@valid_attributes)
  end

  describe "#total" do

    it "should return the sum of sub_total and tax" do
      sale = Factory(:sale, :sub_total => 13.33, :tax => 1.67)
      sale.total.should == 15.00
    end

  end
end
