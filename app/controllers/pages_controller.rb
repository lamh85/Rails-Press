class PagesController < ApplicationController

    def root
    end

    def show
        @page = Page.find_by_slug(params[:slug])
        render 'show'
    end
end
