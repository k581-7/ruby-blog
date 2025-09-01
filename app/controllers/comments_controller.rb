class CommentsController < ApplicationController
   def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user ||= User.find_by(username: "Anonymous")
  
    if @comment.save
      redirect_to @article
    else
      render 'comments/comment'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
