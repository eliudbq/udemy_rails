class SessionsController < ApplicationController
  def new 
  end

  def create
    # session es el arreglo que envia el formulario en el scope
    # el arreglo session tiene las variables de los input
    user=User.find_by(name: params[:session][:usuario])
    if user && user.authenticate(params[:session][:clave])
      flash.now[:alert] = 'ingreso al sistema'
      redirect_to users_path
    else
      flash.now[:alert] = 'se equivoco en algún campo'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end