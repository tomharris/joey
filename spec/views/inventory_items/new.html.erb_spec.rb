require 'spec_helper'

describe "/inventory_items/new.html.erb" do

  before(:each) do
    assigns[:inventory_item] = Factory.build(:inventory_item)
  end

  it "renders new inventory_item form" do
    render

    response.should have_tag("form[action=?][method=post]", inventory_items_path) do
      with_tag("input#inventory_item_name[name=?]", "inventory_item[name]")
      with_tag("input#inventory_item_price[name=?]", "inventory_item[price]")
    end
  end
end
