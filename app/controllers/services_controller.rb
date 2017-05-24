class ServicesController < ApplicationController

    def index
		@services=Service.all
		#@review = Review.new
		#@reviews = @service.reviews
	end

	def pediatric
	end

end	