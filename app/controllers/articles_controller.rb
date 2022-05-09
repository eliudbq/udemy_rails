class ArticlesController < ApplicationController
  before_action :buscar, only: [:edit, :update, :destroy]

  def index
    # @articulos = Article.all.paginate(page: params[:page], per_page: 50)
    @articulos = Article.paginate(page: params[:page], per_page: 2)
    @autores = User.all
    @auto = []
    @autores.each do |aut|
      @auto[aut.id] = aut.name
    end
  end

  def new
    @articulo = Article.new
  end

  def create
    @articulo = Article.new(parametrizar)
    if @articulo.save
      flash[:notice] = 'ARTICULO AGREGADO A BASE DE DATOS SATISFACTORIAMENTE.'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @articulo.update(parametrizar)
      flash[:notice] = 'ARTICULO MODIFICADO SATISFACTORIAMENTE.'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @articulo.destroy
    redirect_to articles_path
  end

  private

  def buscar
    @articulo = Article.find(params[:id])
  end

  def parametrizar
    params.require(:article).permit(:titulo, :texto, :categoria,:user_id, :fecha, :precio)
  end
end
