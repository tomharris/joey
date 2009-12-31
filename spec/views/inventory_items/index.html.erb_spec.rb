require 'spec_helper'

describe "/inventory_items/index.html.erb" do

  before(:each) do
    assigns[:inventory_items] = @inventory_items = [
      Factory(:inventory_item,
        :name => "value for name",
        :price => 9.99
      ),
      Factory(:inventory_item,
        :name => "value for name",
        :price => 9.99
      )
    ]
  end

  it "renders a list of inventory_items" do
    render
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", number_to_currency(9.99), 2)
  end

  it "should have a link to edit the inventory item" do
    render
    response.should have_tag("a[href=?]", edit_inventory_item_path(@inventory_items.first))
    response.should have_tag("a[href=?]", edit_inventory_item_path(@inventory_items.last))
  end

  it "should have a link to remove the inventory item" do
    render
    response.should have_tag("a", "Remove")
  end

end
