class ReviewsController < ApplicationController

    before_action :authenticate_user!, except: [:index]
    load_and_authorize_resource
	def index 
		@reviews = Review.all
    end

    def new
    	@review = Review.new
    end

    def create
    	@review = Review.new(review_params)
    	@review.user_id = current_user.id
    	if @review.save
            redirect_to reviews_path, notice: "successfully created"
    	else
    		render action: "new"
    	end
    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
		@review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        if @review.save
                redirect_to reviews_path, notice: "successfully updated"
        else
            render action: "edit"
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        #redirect_to service_path(@review.service_id), notice: "successfully destroyed"
        redirect_to reviews_path, notice: "successfully destroyed"
    end

    private

    def review_params
    	params[:review].permit(:service_id, :user_id, :comment, :rating)
    end
end

