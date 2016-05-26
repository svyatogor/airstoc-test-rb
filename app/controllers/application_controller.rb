require "application_responder"

class ApplicationController < ActionController::API
	include ActionController::Serialization
	self.responder = ApplicationResponder
	respond_to :json
end
