class UsersController < ApplicationController
  before_action :buscar, only: [:edit, :update, :destroy]
  def index
    @usuarios = User.paginate({ page: params[:page], per_page: 4 })
  end

  def new
    @usuario = User.new
  end

  def create
    @usuario = User.new(parametrizar)
    if @usuario.save
      flash[:notice] = 'usuario AGREGADO A BASE DE DATOS SATISFACTORIAMENTE.'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    #@usuario[parametrizar]
    if @usuario.update(parametrizar)
      flash[:notice] = 'ARTICULO MODIFICADO SATISFACTORIAMENTE.'
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @usuario.destroy
    redirect_to users_path
  end

  private

  def buscar
    @usuario = User.find(params[:id])
  end

  def parametrizar
    params.require(:user).permit(:name, :mail, :password)
  end
end
