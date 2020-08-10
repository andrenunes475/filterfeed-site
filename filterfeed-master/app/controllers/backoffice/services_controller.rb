class Backoffice::ServicesController < Backoffice::BackofficeController
  def index
    @services = Service.order(:id)
  end

  def new
    @service = Service.new
  end

  def create
    service = Service.new(service_params)

    if service.save
      flash[:success] = 'Produto cadastrado com sucesso!'
      redirect_to backoffice_services_path
    else
      flash[:error] = 'Erro ao cadastrar novo produto!'
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    service = Service.find(params[:id])

    if service.update(service_params)
      flash[:success] = 'Produto editado com sucesso!'
      redirect_to backoffice_services_path
    else
      flash[:error] = 'Não foi possível editar o produto!'
      render :edit
    end
  end

  def destroy
    service = Service.find(params[:id])

    if service.destroy
      flash[:success] = 'Produto excluído com sucesso!'
      redirect_to backoffice_services_path
    else
      flash[:error] = 'Não foi possível excluir o produto!'
      redirect_to backoffice_services_path
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :text, :image)
  end
end
