require 'spec_helper'

describe DashboardController do
  
  before(:each) do
    @user = Factory(:admin_user)
  end

  describe "GET admin" do

    def do_get
      get :admin
    end

    it_should_require_admin_sign_in
    
    it "should render the admin template" do
      sign_in_as(@user)
      do_get
      response.should render_template("admin")
    end

  end

end
