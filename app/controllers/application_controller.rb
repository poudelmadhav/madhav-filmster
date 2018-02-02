class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  config.generators do |g|
	  g.helper false
	  g.assets false
	end
end
