class CategoriesController < ApplicationController
  def index
    if params[:query].present?
      @categories = Category.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @categories = Category.all
    end
  end
end
