require 'spec_helper'

describe InventoryItemsController do

  before(:each) do
    @user = Factory(:user)
    @admin_user = Factory(:admin_user)
  end

  describe "GET index" do

    before(:each) do
      @inventory_items = [Factory(:inventory_item)]
    end

    def do_get
      get :index
    end

    it_should_require_sign_in

    it "assigns all inventory_items as @inventory_items" do
      sign_in_as(@user)
      do_get
      assigns[:inventory_items].should == @inventory_items
    end

  end

  describe "GET new" do

    def do_get
      get :new
    end

    it_should_require_admin_sign_in

    it "assigns a new inventory_item as @inventory_item" do
      sign_in_as(@admin_user)
      do_get
      assigns[:inventory_item].should_not be_nil
    end

  end

  describe "GET edit" do

    before(:each) do
      @inventory_item = Factory(:inventory_item)
    end

    def do_get
      get :edit, :id => @inventory_item.id
    end

    it_should_require_admin_sign_in

    it "assigns the requested inventory_item as @inventory_item" do
      sign_in_as(@admin_user)
      do_get
      assigns[:inventory_item].should == @inventory_item
    end

  end

  describe "POST create" do

    def do_post
      post :create, :inventory_item => Factory.attributes_for(:inventory_item)
    end

    it_should_require_admin_sign_in

    describe "with valid params" do

      it "assigns a newly created inventory_item as @inventory_item" do
        sign_in_as(@admin_user)
        do_post
        assigns[:inventory_item].should_not be_nil
      end

      it "should create the inventory_item" do
        sign_in_as(@admin_user)
        lambda { do_post }.should change(InventoryItem, :count).by(1)
      end

      it "should redirect to the index action on success" do
        sign_in_as(@admin_user)
        do_post
        response.should redirect_to(:action => :index)
      end

      it "should set the flash message" do
        sign_in_as(@admin_user)
        do_post
        flash[:notice].should_not be_nil
      end

    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved inventory_item as @inventory_item" do
        sign_in_as(@admin_user)
        post :create, :inventory_item => {}
        assigns[:inventory_item].should_not be_nil
      end

      it "re-renders the 'new' template" do
        sign_in_as(@admin_user)
        post :create, :inventory_item => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT update" do

    before(:each) do
      @inventory_item = Factory(:inventory_item)
      @new_attributes = Factory.attributes_for(:inventory_item)
    end

    def do_put
      put :update, :id => @inventory_item.id, :inventory_item => @new_attributes
    end

    it_should_require_admin_sign_in

    describe "with valid params" do

      it "updates the requested inventory_item" do
        sign_in_as(@admin_user)
        do_put
        @inventory_item.reload
        @new_attributes.keys.each { |key| @inventory_item.send(key).should == @new_attributes[key] }
      end

      it "assigns the requested inventory_item as @inventory_item" do
        sign_in_as(@admin_user)
        do_put
        assigns[:inventory_item].should_not be_nil
      end

      it "redirects back to index" do
        sign_in_as(@admin_user)
        do_put
        response.should redirect_to(:action => :index)
      end

    end

    describe "with invalid params" do

      it "assigns the inventory_item as @inventory_item" do
        sign_in_as(@admin_user)
        put :update, :id => @inventory_item.id, :inventory_item => { :name => "" }
        assigns[:inventory_item].should_not be_nil
      end

      it "re-renders the 'edit' template" do
        sign_in_as(@admin_user)
        put :update, :id => @inventory_item.id, :inventory_item => { :name => "" }
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    before(:each) do
      @inventory_item = Factory(:inventory_item)
    end

    def do_delete
      delete :destroy, :id => @inventory_item.id
    end

    it_should_require_admin_sign_in

    it "destroys the requested inventory_item" do
      sign_in_as(@admin_user)
      lambda { do_delete }.should change(InventoryItem, :count).by(-1)
    end

    it "redirects to index" do
      sign_in_as(@admin_user)
      do_delete
      response.should redirect_to(:action => :index)
    end

  end

end
