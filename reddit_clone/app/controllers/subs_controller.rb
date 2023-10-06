class SubsController < ApplicationController
    validates :title, :moderator_id, presence: true
    before_action :is_moderator?, only: [:update, :edit]

    def index
        @subs = Subs.all
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to users_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to user_url(@sub.moderator_id)
        else
            flash[:errors] = @sub.errors.full_messages
            render :error
        end
    end

    # def show
    #     @sub
    # end

    def is_moderator?
        @sub = Sub.find_by(id: params[:id])
        current_user == @sub.moderator_id
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
