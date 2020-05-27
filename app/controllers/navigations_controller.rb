# frozen_string_literal: true

class NavigationsController < ApplicationController
  def index
    @menus = Menu.all.order(created_at: :desc)
  end
  
  def create
    @active_menu = Menu.create(menu_params)
    redirect_to navigation_path(@active_menu.slug), notice: 'Menu was successfully created.'
  end

  def show
    @menus = Menu.all.order(created_at: :desc)
    @active_menu = Menu.find_by(slug: params[:id])
    render :index
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :slug)
  end
end
