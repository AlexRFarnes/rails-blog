class ArticlesController < ApplicationController
    # Una variable de instancia, @variable, esta disponible dentro de la vista correspondiente, mientras que una variable local, variable, solo esta disponible dentro del controlador
    before_action :find_article, only: [:show, :edit, :update, :destroy] # except: [:new, :create, :index]
    # before_action :find_article, except: [:new, :create, :index]
    # after_action 
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
     
    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        # @article.update(title: params[:article][:title], content: params[:article][:content])
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        # paras[:article] porque al construir el formulario se esta haciendo con base en un objeto del tipo Article y luego usamos el nombre del control [:control_name] 
        # @article = Article.create(title: params[:article][:title], content: params[:article][:content], user: current_user)
        # @article = current_user.articles.create(params[:article])
        @article = current_user.articles.create(article_params)
        @article.save_categories
        # Display in json format
        # render json: @article
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content, category_elements: [])
    end
end
