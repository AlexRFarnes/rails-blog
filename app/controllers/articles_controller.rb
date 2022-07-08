class ArticlesController < ApplicationController
    # Una variable de instancia, @variable, esta disponible dentro de la vista correspondiente, mientras que una variable local, variable, solo esta disponible dentro del controlador
    before_action :find_article, only: [:show, :edit, :update, :destroy] # except: [:new, :create]
    # after_action 
     
    def show
    end

    def edit
    end

    def update
        @article.update(title: params[:article][:title], content: params[:article][:content])
        redirect_to @article
    end

    def new
        @article = Article.new
    end

    def create
        # paras[:article] porque al construir el formulario se esta haciendo con base en un objeto del tipo Article y luego usamos el nombre del control [:control_name] 
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        # Display in json format
        render json: @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end
end
