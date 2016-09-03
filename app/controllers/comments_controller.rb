class CommentsController < ApplicationController

  def index
    @topic = Topic.includes(:posts).find_by(id: params[:topic_id])
    @posts = Post.includes(:comments).find_by(id: params[:post_id])
    @comments = @post.comments
  end

  def new
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comments = comments.new
  end

  def create

    @topic = current_user.topics.build(topic_params)

  if @topic.save
    redirect_to topics_path
  else
    redirect_to new_topic_path
  end

    @comment = Comment.new(post_params.merge(post_id: params[:post_id]))
    @post = @comment.post
    @topic = @post.topic

    if @comment.save
      redirect_to topic_posts_comments_path(@topic, @post)
    else
      redirect_to new_topic_post_comment_path(@post)
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
  end

  def update
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to topic_posts_path(@topic)
    else
      redirect_to edit_topic_post_path(@topic, @post)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic

    if @post.destroy
      redirect_to topic_posts_path(@topic)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
