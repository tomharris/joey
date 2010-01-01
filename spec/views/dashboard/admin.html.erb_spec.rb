require 'spec_helper'

describe "/dashboard/admin.html.erb" do

  it "should have a link to mange users" do
    render
    response.should have_tag("a[href=?]", users_path)
  end

  it "should have a link to mange customers" do
    render
    response.should have_tag("a[href=?]", customers_path)
  end

  it "should have a link to mange inventory" do
    render
    response.should have_tag("a[href=?]", inventory_items_path)
  end

end
