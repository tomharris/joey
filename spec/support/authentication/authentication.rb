module ControllerExampleHelpers
  module ExampleMethods
    def do_action
      verb = [:get, :post, :put, :delete].find{|verb| respond_to? :"do_#{verb}"}
      raise "No do_get, do_post_ do_put, or do_delete has been defined!" unless verb
      send("do_#{verb}")
    end

    def sign_in_as(user)
      controller.stub!(:current_user).and_return(user)
    end

    def should_require_sign_in
      user = Factory(:user)
      response.should be_redirect
      response.should redirect_to(new_user_session_path)
      flash[:notice].should =~ /^You must be logged in/
    end

    def should_not_require_sign_in
      flash[:notice].should_not =~ /^You must be logged in/
    end
  end

  module ExampleGroupMethods
    def it_should_require_sign_in
      it "should require sign in" do
        do_action
        should_require_sign_in

        user = Factory(:user)
        sign_in_as(user)
        do_action
        should_not_require_sign_in
      end
    end

    def it_should_require_admin_sign_in
      it "should require admin sign in" do
        do_action
        should_require_sign_in

        user = Factory(:user)
        sign_in_as(user)
        do_action
        should_require_sign_in

        user = Factory(:admin_user)
        sign_in_as(user)
        do_action
        should_not_require_sign_in
      end
    end

    def it_should_not_require_sign_in
      it "should not require sign in" do
        do_action
        should_not_require_sign_in
      end
    end
  end
end