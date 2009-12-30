require 'spec_helper'

describe SalesController do

  before(:each) do
    @user = Factory(:user)
  end

  describe "GET #new" do

    def do_get
      get :new
    end

    it_should_require_sign_in

    it "should assign sale" do
      sign_in_as(@user)
      do_get
      assigns[:sale].should_not be_nil
    end

  end

  describe "POST #create" do

    def do_post
      post :create, :sale => Factory.attributes_for(:sale)
    end

    it_should_require_sign_in

    it "should create a new sale" do
      sign_in_as(@user)
      lambda { do_post }.should change(Sale, :count).by(1)
    end

    it "should associate the current user to the sale" do
      sign_in_as(@user)
      do_post
      assigns[:sale].user.should == @user
    end

    it "should redirect to 'thank you' page on success" do
      sign_in_as(@user)
      do_post
      response.should redirect_to(:action => :thank_you)
    end

    it "should render #new with errors" do
      sign_in_as(@user)
      post :create, :sale => {}
      response.should render_template(:new)
    end

  end

  describe "GET #thank_you" do

    def do_get
      get :thank_you
    end

    it_should_require_sign_in

    it "should render the template" do
      sign_in_as(@user)
      do_get
      response.should render_template("thank_you")
    end

  end

end
