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

    begin
      # formatted_comment_params = comment_params.as_json
      # formatted_comment_params["article_id"] = request.params["article_id"]

      @article_id = request.params["article_id"]

      @comment = Comment.new(comment_params)
      binding.pry
      @comment.article_id = @article_id
      @comment.save
      # binding.pry
      render json: @comment

    rescue ActiveRecord::RecordInvalid => e
      # binding.pry
      render json: e.to_json
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
