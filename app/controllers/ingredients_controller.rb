class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :show, :update]


  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredients_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end

end
