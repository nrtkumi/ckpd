class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @recipes = Recipe.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.set_image(params[:recipe][:image])

    if @recipe.save


      food = "food0"
      i = 0
      while params[food] != nil do
        f = Food.new
        f.recipe_id = @recipe.id
        f.content = params[food]
        f.save
        i += 1
        food = "food#{i}"
      end

      way = "way0"
      j = 0
      while params[way] != nil do
        w = Way.new
        w.recipe_id = @recipe.id
        w.content = params[way]
        w.save
        j += 1
        way = "way#{j}"
      end

      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    @recipes = Recipe.search(params[:q])
    render :index
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :image, :caption)
  end
end
