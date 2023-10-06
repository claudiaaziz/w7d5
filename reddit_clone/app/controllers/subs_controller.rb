class SubsController < ApplicationController
    def index
        @subs = Subs.all
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        
    end

    def edit

    end

    def update

    end

    def show

    end
end
