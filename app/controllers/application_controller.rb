class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_user

  private
  def set_user
  	@user_email = current_user.email if current_user.present?
  end
end
