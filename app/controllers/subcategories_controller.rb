class SubcategoriesController < ApplicationController
  before_action :set_category, only: %i[index new create edit update destroy]
  before_action :set_subcategory, only: %i[edit update destroy]

  def index
    @subcategories = @category.subcategories.order(id: :desc)
  end

  def new
    @subcategory = @category.subcategories.build
  end

  def create
    @subcategory = @category.subcategories.build(subcategory_params)
    @subcategory.user = current_user

    if @subcategory.save
      flash[:success] = 'Subcategoria cadastrada com sucesso.'
      redirect_to category_subcategories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subcategory.update(subcategory_params)
      flash[:success] = 'Subcategoria atualizada com sucesso.'
      redirect_to category_subcategories_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = 'Subcategoria excluída com sucesso.' if @subcategory.destroy
    redirect_to category_subcategories_path
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name)
  end

  def set_subcategory
    @subcategory = @category.subcategories.find(params[:id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end
end
