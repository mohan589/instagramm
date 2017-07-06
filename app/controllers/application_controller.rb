class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  private
  def record_not_found
    render 'shared/record_not_found' # Assuming you have a template named 'record_not_found'
  end
end
