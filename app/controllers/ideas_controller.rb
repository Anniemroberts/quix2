class IdeasController < ApplicationController
 before_action :authenticate_user!, except: [:show, :index]

 before_action(:find_idea, { only: [:show, :edit, :destroy, :update] })
 before_action :authorize, only: [:edit, :destroy, :update]

def new
 if user_signed_in?
   @idea = Idea.new
   render :new
 else
   render :new_session_path
 end
end

def create
  @idea  = Idea.new(idea_params)
  @idea.user = current_user
  if @idea.save
    flash[:notice] = 'Idea created successfully'
    redirect_to idea_path(@idea)
  else
    flash.now[:alert] = 'Please fix errors below'
    render :new
  end
end

def show
  @idea = Idea.find params[:id]
  @review = Review.new
end

def index
  @idea = Idea.new
  @ideas = Idea.order(created_at: :desc)
end

def edit
  if current_user != @idea.user
    redirect_to root_path, alert: 'Not authorized'
  end
end

def update
  if @idea.update idea_params
    redirect_to idea_path(@idea), notice: 'Idea updated!'
  else
    render :edit
  end
end

def destroy
  @idea.destroy
  redirect_to ideas_path, notice: 'Idea deleted!'
end

private

def idea_params
  # this feature is called strong parameters (introduced in Rails 4+)
  params.require(:idea).permit([:title, :description])
end

def find_idea
  @idea = Idea.find params[:id]
end

def authorize
  if cannot?(:manage, @idea)
  redirect_to root_path, alert: 'Not authorized!'
  end
end
end
