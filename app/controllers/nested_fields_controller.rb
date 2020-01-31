# frozen_string_literal: true

class NestedFieldsController < ApplicationController
	def show
		@restaurant = Restaurant.new

		session[:restaurants_menus] ||= [] 
		@restaurants_menus = session[:restaurants_menus]
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_restaurant
	    @restaurant = Restaurant.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def restaurant_params
	    params.require(:restaurant).permit(:name, :stars, :price, :category, restaurant_menus_attributes: [:id, :title, :_destroy])
	  end
end
