require 'spec_helper'

describe "/customers/index.html.erb" do

  before(:each) do
    assigns[:customers] = @customers = [
      Factory(:customer),
      Factory(:customer)
    ]
  end

  it "renders a list of customers" do
    render
    response.should have_tag("tbody > tr", :count => 2)
  end

  it "should show their name" do
    render
    response.should have_tag("td", @customers.first.full_name)
    response.should have_tag("td", @customers.last.full_name)
  end

  it "should show their balance" do
    render
    response.should have_tag("td", number_to_currency(@customers.first.balance))
    response.should have_tag("td", number_to_currency(@customers.last.balance))
  end
  
  it "should have a link to edit the customer" do
    render
    response.should have_tag("a[href=?]", edit_customer_path(@customers.first))
    response.should have_tag("a[href=?]", edit_customer_path(@customers.last))
  end

  it "should have a link to remove the customer" do
    render
    response.should have_tag("a", "Remove")
  end

end
