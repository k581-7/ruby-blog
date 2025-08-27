class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(id)
    end

    def new
        @article = Article.new
    end

    def create
         @article = Article.new(article_params)
        # @article.name = params[:name]
        # @article.body = params[:body]

        if @article.save
            puts "saved"
            redirect_to articles_path
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def delete
    end

    private 
    def article_params
        params.require(:article).permit(:name, :body)
    end
end
