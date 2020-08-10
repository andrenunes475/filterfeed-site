class Backoffice::UsersController < Backoffice::BackofficeController
  before_action :authenticate_admin!

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = 'Usuário cadastrado com sucesso!'
      redirect_to backoffice_users_path
    else
      flash[:erro] = 'Erro ao cadastrar o usuário!'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      flash[:success] = 'Usuário atualizado com sucesso!'
      redirect_to backoffice_users_path
    else
      flash[:erro] = 'Erro ao atualizar o usuário!'
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      flash[:success] = 'Usuário excluído com sucesso!'
      redirect_to backoffice_users_path
    else
      flash[:erro] = 'Erro ao excluir o usuário!'
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

end
