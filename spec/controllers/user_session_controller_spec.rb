require 'spec_helper'

describe UserSessionsController do

  before(:each) do
    @user = Factory(:user, :password => "password", :password_confirmation => "password")
  end

  describe "GET new" do

    def do_get
      get :new
    end

    it_should_not_require_sign_in

    it "should assign user_session" do
      do_get
      assigns[:user_session].should_not be_nil
    end

  end

  describe "POST create" do

    def do_post
      post :create, :user_session => { :login => @user.login, :password => "password" }
    end

    it_should_not_require_sign_in

    it "should redirect non-admins to the new sales form" do
      do_post
      response.should redirect_to(new_sale_path)
    end

    it "should redirect admins to their dashboard" do
      @user = Factory(:admin_user, :password => "password", :password_confirmation => "password")
      do_post
      response.should redirect_to(admin_dashboard_path)
    end

    it "should set a flash message" do
      do_post
      flash[:notice].should_not be_nil
    end

  end

  describe "DELETE destroy" do

    def do_delete
      delete :destroy
    end

    it "should require sign in" do
      do_delete
      response.should redirect_to(new_user_session_path)
      flash[:notice].should_not == "Logout successful!"
    end

    describe "when signed in" do

      before(:each) do
        @user_session = mock("session", :null_object => true)
        @user_session.stub!(:destroy).and_return(true)
        controller.stub!(:current_user_session).and_return(@user_session)
      end

      it "should destroy the session" do
        @user_session.should_receive(:destroy).and_return(true)
        do_delete
      end

      it "should set a flash message" do
        do_delete
        flash[:notice].should_not be_nil
      end

      it "should redirect back to the login page" do
        do_delete
        response.should redirect_to(new_user_session_path)
      end

    end

  end

end
