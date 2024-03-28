class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.all
    render json: @comments
  end

  def new
    @comment = Comment.new
  end

  def create
    # @article = Article.find(comment_params[:article_id])
    # @topic = Topic.find(comment_params[:topics_id])

    @comment = Comment.create!(comment_params)

    if @comment.save
      render json: @comment
    else
      # render json: 'oops!'
      render json: @comment
    end

    # render json: @comment
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :topic_id, :article_id)
    end
end
