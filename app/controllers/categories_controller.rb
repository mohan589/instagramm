class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]
    
    def index
        @categories = Category.all.order("created_at DESC")
        @category = Category.new
    end
    
    def new
        @category = Category.new
    end
    
    def show
    end
    
    def create
        @category = Category.create(category_params)
        
        if @category.save
            @categories = Category.all.order("created_at DESC")
        else
            render 'new'
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:job_category_name)
    end
    
    def set_category
        @category = Category.find(params[:id])
    end
end
