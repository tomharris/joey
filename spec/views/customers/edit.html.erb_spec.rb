require 'spec_helper'

describe "/customers/edit.html.erb" do

  before(:each) do
    assigns[:customer] = @customer = Factory(:customer)
  end

  it "renders the edit customer form" do
    render

    response.should have_tag("form[action=#{customer_path(@customer)}][method=post]") do
    end
  end

  it "should be able to edit the first name" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[first_name]")
  end

  it "should be able to edit the last name" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[last_name]")
  end

  it "should be able to edit the balance" do
    render
    response.should have_tag("input[type=text][name=?]", "customer[balance]")
  end

end
