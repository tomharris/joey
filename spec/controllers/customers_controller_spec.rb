require 'spec_helper'

describe CustomersController do

  before(:each) do
    @user = Factory(:user)
  end

  describe "GET index" do

    before(:each) do
      @customers = [Factory(:customer)]
    end

    def do_get
      get :index
    end

    it_should_require_sign_in

    it "assigns all customers as @customers" do
      sign_in_as(@user)
      do_get
      assigns[:customers].should == @customers
    end

  end

  describe "GET new" do

    def do_get
      get :new
    end

    it_should_require_sign_in

    it "assigns a new customer as @customer" do
      sign_in_as(@user)
      do_get
      assigns[:customer].should_not be_nil
    end

  end

  describe "GET edit" do

    before(:each) do
      @customer = Factory(:customer)
    end

    def do_get
      get :edit, :id => @customer.id
    end

    it_should_require_sign_in

    it "assigns the requested customer as @customer" do
      sign_in_as(@user)
      do_get
      assigns[:customer].should == @customer
    end

  end

  describe "POST create" do

    def do_post
      post :create, :customer => Factory.attributes_for(:customer)
    end

    it_should_require_sign_in

    describe "with valid params" do

      it "assigns a newly created customer as @customer" do
        sign_in_as(@user)
        do_post
        assigns[:customer].should_not be_nil
      end

      it "should create the customer" do
        sign_in_as(@user)
        lambda { do_post }.should change(Customer, :count).by(1)
      end

      it "should redirect to the index action on success" do
        sign_in_as(@user)
        do_post
        response.should redirect_to(:action => :index)
      end

      it "should set the flash message" do
        sign_in_as(@user)
        do_post
        flash[:notice].should_not be_nil
      end

    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved customer as @customer" do
        sign_in_as(@user)
        post :create, :customer => {}
        assigns[:customer].should_not be_nil
      end

      it "re-renders the 'new' template" do
        sign_in_as(@user)
        post :create, :customer => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT update" do

    before(:each) do
      @customer = Factory(:customer)
      @new_attributes = Factory.attributes_for(:customer)
    end

    def do_put
      put :update, :id => @customer.id, :customer => @new_attributes
    end

    it_should_require_sign_in

    describe "with valid params" do

      it "updates the requested customer" do
        sign_in_as(@user)
        do_put
        @customer.reload
        @new_attributes.keys.each { |key| @customer.send(key).should == @new_attributes[key] }
      end

      it "assigns the requested customer as @customer" do
        sign_in_as(@user)
        do_put
        assigns[:customer].should_not be_nil
      end

      it "redirects back to index" do
        sign_in_as(@user)
        do_put
        response.should redirect_to(:action => :index)
      end

    end

    describe "with invalid params" do

      it "assigns the customer as @customer" do
        sign_in_as(@user)
        put :update, :id => @customer.id, :customer => { :last_name => "" }
        assigns[:customer].should_not be_nil
      end

      it "re-renders the 'edit' template" do
        sign_in_as(@user)
        put :update, :id => @customer.id, :customer => { :last_name => "" }
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    before(:each) do
      @customer = Factory(:customer)
    end

    def do_delete
      delete :destroy, :id => @customer.id
    end

    it_should_require_sign_in

    it "destroys the requested customer" do
      sign_in_as(@user)
      lambda { do_delete }.should change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      sign_in_as(@user)
      do_delete
      response.should redirect_to(:action => :index)
    end

  end

end
