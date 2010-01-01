class DashboardController < ApplicationController
  before_filter :require_admin, :only => [:admin]

  def admin
  end
end
