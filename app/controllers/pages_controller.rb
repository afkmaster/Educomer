class PagesController < ApplicationController
	def home
		@path = params[:action]
	end

	def search
	end
end
