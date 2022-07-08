class ArticlesController < ApplicationController
    # Una variable de instancia, @variable, esta disponible dentro de la vista correspondiente, mientras que una variable local, variable, solo esta disponible dentro del controlador
    before_action :find_article
     
    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
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
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end

    def find_article
        puts "Estoy en find article"
    end
end
