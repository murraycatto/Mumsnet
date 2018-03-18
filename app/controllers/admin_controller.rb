class AdminController < ApplicationController
  layout "admin_layout"
  before_action :authenticate_user!
end
