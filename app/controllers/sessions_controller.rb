class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def initialize
    super
  end
end