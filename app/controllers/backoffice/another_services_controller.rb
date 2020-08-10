class Backoffice::AnotherServicesController < Backoffice::BackofficeController
  def index
    @another_services = Anotherservice.order(:id)
  end

  def new
    @another_service = Anotherservice.new
  end

  def create
    another_service = Anotherservice.new(another_service_params)

    if another_service.save
      flash[:success] = 'Produto cadastrado com sucesso!'
      redirect_to backoffice_another_services_path
    else
      flash[:error] = 'Erro ao cadastrar novo produto!'
      render :new
    end
  end

  def edit
    @another_service = Anotherservice.find(params[:id])
  end

  def update
    another_service = Anotherservice.find(params[:id])

    if another_service.update(another_service_params)
      flash[:success] = 'Produto editado com sucesso!'
      redirect_to backoffice_another_services_path
    else
      flash[:error] = 'Não foi possível editar o produto!'
      render :edit
    end
  end

  def destroy
    another_service = Anotherservice.find(params[:id])

    if another_service.destroy
      flash[:success] = 'Produto excluído com sucesso!'
      redirect_to backoffice_another_services_path
    else
      flash[:error] = 'Não foi possível excluir o produto!'
      redirect_to backoffice_another_services_path
    end
  end

  private

  def another_service_params
    params.require(:anotherservice).permit(:name, :text)
  end
end
