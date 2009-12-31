require 'spec_helper'

describe "/customers/new.html.erb" do

  before(:each) do
    assigns[:customer] = Factory.build(:customer)
  end

  it "renders new customer form" do
    render

    response.should have_tag("form[action=?][method=post]", customers_path) do
    end
  end

  it "should be able to enter the first name" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[first_name]")
  end

  it "should be able to enter the last name" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[last_name]")
  end

  it "should be able to enter the balance" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[balance]")
  end

end
