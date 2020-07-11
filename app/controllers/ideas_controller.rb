class IdeasController < ApplicationController
    before_action :get_idea, only: [:show, :destroy, :edit, :update]

    def index
        @ideas = Idea.all
    end

    def show
    end

    def edit
    end

    def update
        @idea.update(idea_params)
        if @idea.valid?
            redirect_to @idea
        else 
           render :edit
        end
    end

    def new
        @idea = Idea.new
    end 

    def create
        @idea = Idea.new(idea_params)
        if @idea.valid?
            @idea.save
            redirect_to @idea
        else 
            render :new
        end
    end 

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end

    private

    def get_idea
        @idea = Idea.find(params[:id])
    end

    def idea_params
        params.require(:idea).permit(:title, :description)
    end
end
