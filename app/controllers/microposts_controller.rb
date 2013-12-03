class MicropostsController < ApplicationController
include MicropostHelper

	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		#@micropost.content = wrap( @micropost.content )
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			#redirect_to root_url
			render '/static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_back_or root_url 
		#'/static_pages/home'
	end

	private

		def correct_user
			@micropost = current_user.microposts.find_by_id(params[:id])
			redirect_to root_url if @micropost.nil?
			#redirect_to '/static_pages/home' if @micropost.nil?
		end

end
