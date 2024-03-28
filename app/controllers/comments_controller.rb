class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @article = Article.find(params[:article_id])
    @topic = Topic.find(1)
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
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
