class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  protect_from_forgery prepend: true
  

  def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for

  end
end
