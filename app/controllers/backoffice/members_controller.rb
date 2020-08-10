class Backoffice::MembersController < Backoffice::BackofficeController
  def index
    @members = Member.order(:id)
  end

  def new
    @member = Member.new
  end

  def create
    member = Member.new(member_params)

    if member.save
      flash[:success] = 'Membro cadastrado com sucesso!'
      redirect_to backoffice_members_path
    else
      flash[:error] = 'Erro ao cadastrar novo membro!'
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])

    if member.update(member_params)
      flash[:success] = 'Membro editado com sucesso!'
      redirect_to backoffice_members_path
    else
      flash[:error] = 'Não foi possível editar o membro!'
      render :edit
    end
  end

  def destroy
    member = Member.find(params[:id])

    if member.destroy
      flash[:success] = 'Membro excluído com sucesso!'
      redirect_to backoffice_members_path
    else
      flash[:error] = 'Não foi possível excluir o membro!'
      redirect_to backoffice_members_path
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :role, :social, :avatar)
  end
end
