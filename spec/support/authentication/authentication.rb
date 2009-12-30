module ControllerExampleHelpers
  module ExampleMethods
    def do_action
      verb = [:get, :post, :put, :delete].find{|verb| respond_to? :"do_#{verb}"}
      raise "No do_get, do_post_ do_put, or do_delete has been defined!" unless verb
      send("do_#{verb}")
    end
  end

  module ExampleGroupMethods
    def it_should_require_sign_in
      it "should require sign in" do
        do_action
        should_require_sign_in
      end
    end

    def it_should_not_require_sign_in
      it "should not require sign in" do
        do_action
        should_not_require_sign_in
      end
    end

    def it_should_render_template(template)
      it "should render the #{template} template" do
        do_action
        response.should render_template(template)
      end
    end
  end
end