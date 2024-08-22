class CommentsController < ApplicationController
  def new
    debugger
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @article.user_id
      @comment.destroy
      flash[:notice] = "Comment deleted."
    else
      flash[:notice] = "Unauthorized!"
    end
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :user_id)
    end
end
