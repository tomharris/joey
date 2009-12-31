require 'spec_helper'

describe "/inventory_items/edit.html.erb" do

  before(:each) do
    assigns[:inventory_item] = @inventory_item = Factory(:inventory_item)
  end

  it "renders the edit inventory_item form" do
    render

    response.should have_tag("form[action=#{inventory_item_path(@inventory_item)}][method=post]") do
      with_tag('input#inventory_item_name[name=?]', "inventory_item[name]")
      with_tag('input#inventory_item_price[name=?]', "inventory_item[price]")
    end
  end
end
