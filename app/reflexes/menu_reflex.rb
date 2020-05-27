class MenuReflex < ApplicationReflex
    def active_menu
        @active_menu = Menu.find(element.dataset[:id])
    end

    def new_menu
        @menu =  Menu.new
        session[:menu_attributes] = @menu.attributes
    end

    def edit_menu_item
        @menu =  Menu.find(element.dataset[:id])
        session[:menu_attributes] = @menu.attributes
    end

    def destroy_menu
        Menu.find(element.dataset[:id]).destroy
    end

    def set_slug
        @menu =  Menu.new
        session[:menu_attributes] = @menu.attributes
        @slug = session[:slug] = element[:value].parameterize
    end
   
end