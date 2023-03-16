class ApplicationController < ActionController::Base
  add_flash_types :error, :success
  def current_user
    User.first
  end
end
