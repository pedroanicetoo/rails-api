class PhonesController < ApplicationController
	before_action :set_phone

	# Get /phones/1
	def show
		render json: @phones
		
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_phone
	  	@phones = Contact.find(params[:contact_id]).phones
	  end
end
