class ArticlesController < ApplicationController
    def show
    end
    
    def new
        @article = Article.new
        puts "Hello"
    end

    def create
        # paras[:article] porque al construir el formulario se esta haciendo con base en un objeto del tipo Article y luego usamos el nombre del control [:control_name] 
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        # Display in json format
        render json: @article
    end
end
