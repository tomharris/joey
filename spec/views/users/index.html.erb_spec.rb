require 'spec_helper'

describe "/users/index.html.erb" do

  before(:each) do
    assigns[:users] = @users = [
      Factory(:user),
      Factory(:admin_user)
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tbody > tr", :count => 2)
  end

  it "should show their name" do
    render
    response.should have_tag("td", @users.first.full_name)
    response.should have_tag("td", @users.last.full_name)
  end

  it "should show their login" do
    render
    response.should have_tag("td", @users.first.login)
    response.should have_tag("td", @users.last.login)
  end

  it "should show if they are an admin" do
    render
    response.should have_tag("td", "No")
    response.should have_tag("td", "Yes")
  end

  it "should have a link to edit the user" do
    render
    response.should have_tag("a[href=?]", edit_user_path(@users.first))
    response.should have_tag("a[href=?]", edit_user_path(@users.last))
  end

  it "should have a link to remove the user" do
    render
    response.should have_tag("a", "Remove")
  end

end
