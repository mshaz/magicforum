
class TopicsController < ApplicationController

  before_action :authenticate!, only: [:create, :edit, :update, :new, :destroy]

  def index
    @topics = Topic.all
  end


  def new
    @topic = Topic.new
  end


  def create

    @topic = current_user.topics.build(topic_params)
    @new_topic = Topic.new


   if @topic.save
     flash[:success] = "You've created a new topic."
     redirect_to root_path
   else
     flash[:danger] = @topic.errors.full_messages
     render :new
   end

  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    @topic = Topic.find_by(id: params[:id])

    if @topic.update(topic_params)
      redirect_to topics_path(@topic)
    else
      redirect_to edit_topic_path(@topic)
    end

  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.destroy
      redirect_to topics_path
    else
      redirect_to topic_path(@topic)
    end

  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :user_id)
  end

end
