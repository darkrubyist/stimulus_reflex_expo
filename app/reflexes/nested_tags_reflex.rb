# frozen_string_literal: true

class NestedTagsReflex < ApplicationReflex
  def add_restaurant
    session[:restaurants_menus] ||= []
    session[:restaurants_menus] << element.dataset[:restaurant]
    @restaurants_menus = session[:restaurants_menus]
  end

  def remove_restaurant
    session[:restaurants_menus] ||= []
    session[:restaurants_menus].delete(element.dataset[:restaurant])
  end

  def remove_existing_restaruant
    restaurant = RestaurantMenu.find(element.dataset[:restaurant])
    restaurant.destroy if restaurant.present?
  end
end
