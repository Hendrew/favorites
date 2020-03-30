class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[edit update destroy]
  before_action :set_categories, only: %i[index new create edit update]
  before_action :set_subcategories, only: %i[index new create edit update]

  def index
    @favorites = current_user.favorites.order(id: :desc).includes(:category).includes(:subcategory)
  end

  def new
    @favorite = current_user.favorites.build
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)

    if @favorite.save
      flash[:success] = 'Favorito cadastrado com sucesso.'
      redirect_to favorites_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @favorite.update(favorite_params)
      flash[:success] = 'Favorito atualizado com sucesso.'
      redirect_to favorites_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = 'Favorito excluído com sucesso.' if @favorite.destroy
    redirect_to favorites_path
  end

  def subcategories
    str = '<option value="">Escolher</option>'
    subcategories = get_subcategories(params[:category_id])

    subcategories.each do |subcategory|
      str << "<option value='#{subcategory.id}'>#{subcategory.name}</option>"
    end

    render plain: str
  end

  private

  def favorite_params
    params.require(:favorite).permit(:title, :link, :category_id, :subcategory_id)
  end

  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  end

  def set_categories
    @categories = current_user.categories.select('id, name').collect { |c| [ c.name, c.id ] }
  end

  def set_subcategories
    if params[:favorite].present?
      category_id = params[:favorite][:category_id]
    elsif @favorite.present?
      category_id = @favorite.category_id
    end

    if category_id.present?
      @subcategories = get_subcategories(category_id).collect { |s| [ s.name, s.id ] }
    else
      @subcategories = []
    end
  end

  def get_subcategories(category_id)
    current_user.subcategories.select('id, name').where(category_id: category_id)
  end
end
