class CommentsController < ApplicationController

   def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)


    if @comment.save
      redirect_to @article
    else
      render "articles/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
