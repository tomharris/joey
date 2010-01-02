require 'spec_helper'

describe UsersController do

  before(:each) do
    @admin_user = Factory(:admin_user)
  end

  describe "GET index" do

    before(:each) do
      @users = [Factory(:user)]
    end

    def do_get
      get :index
    end

    it_should_require_admin_sign_in

    it "assigns all users as @users" do
      sign_in_as(@admin_user)
      do_get
      assigns[:users].should == User.all
    end

  end

  describe "GET new" do

    def do_get
      get :new
    end

    it_should_require_admin_sign_in

    it "should assign user" do
      sign_in_as(@admin_user)
      do_get
      assigns[:user].should_not be_nil
    end

  end

  describe "GET edit" do

    before(:each) do
      @user = Factory(:user)
    end

    def do_get
      get :edit, :id => @user.id
    end

    it_should_require_admin_sign_in

    it "assigns the requested user as @user" do
      sign_in_as(@admin_user)
      do_get
      assigns[:user].should == @user
    end

  end

  describe "POST create" do

    def do_post
      post :create, :user => Factory.attributes_for(:user)
    end

    it_should_require_admin_sign_in

    describe "with valid params" do

      it "assigns a newly created user as @user" do
        sign_in_as(@admin_user)
        do_post
        assigns[:user].should_not be_nil
      end

      it "should create the user" do
        sign_in_as(@admin_user)
        lambda { do_post }.should change(User, :count).by(1)
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

      it "assigns a newly created but unsaved user as @user" do
        sign_in_as(@admin_user)
        post :create, :user => {}
        assigns[:user].should_not be_nil
      end

      it "re-renders the 'new' template" do
        sign_in_as(@admin_user)
        post :create, :user => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT update" do

    before(:each) do
      @user = Factory(:user)
      @new_attributes = Factory.attributes_for(:user)
    end

    def do_put
      put :update, :id => @user.id, :user => @new_attributes
    end

    it_should_require_admin_sign_in

    describe "with valid params" do

      it "updates the requested user" do
        sign_in_as(@admin_user)
        do_put
        @user.reload
        @new_attributes.keys.each { |key| @user.send(key).should == @new_attributes[key] }
      end

      it "assigns the requested user as @user" do
        sign_in_as(@admin_user)
        do_put
        assigns[:user].should_not be_nil
      end

      it "redirects back to index" do
        sign_in_as(@admin_user)
        do_put
        response.should redirect_to(:action => :index)
      end

    end

    describe "with invalid params" do

      it "assigns the user as @user" do
        sign_in_as(@admin_user)
        put :update, :id => @user.id, :user => { :last_name => "" }
        assigns[:user].should_not be_nil
      end

      it "re-renders the 'edit' template" do
        sign_in_as(@admin_user)
        put :update, :id => @user.id, :user => { :last_name => "" }
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    before(:each) do
      @user = Factory(:user)
    end

    def do_delete
      delete :destroy, :id => @user.id
    end

    it_should_require_admin_sign_in

    it "destroys the requested user" do
      sign_in_as(@admin_user)
      lambda { do_delete }.should change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      sign_in_as(@admin_user)
      do_delete
      response.should redirect_to(:action => :index)
    end

  end

end
