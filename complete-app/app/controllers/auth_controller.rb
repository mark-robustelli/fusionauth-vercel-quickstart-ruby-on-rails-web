class AuthController < ApplicationController

  skip_before_action :authenticate_user!

  def logout
    session[:user] = nil
    redirect_to Rails.configuration.x.fusionauth.issuer+"/oauth2/logout?client_id="+Rails.configuration.x.fusionauth.client_id
  end

  def callback
    #puts request.env['omniauth.auth'].info.inspect
    session[:user] = request.env['omniauth.auth'].info
    redirect_to '/'
  end
end
