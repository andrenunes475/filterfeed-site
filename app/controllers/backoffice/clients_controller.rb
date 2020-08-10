class Backoffice::ClientsController < Backoffice::BackofficeController
  def index
    @clients = Client.order(:id)
  end

  def new
    @client = Client.new
    @client.emails.build
  end

  def create
    keys = [
      'A', 'B', 'C', 'D', 'E', 'F',
      'G', 'H', 'I', 'J', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S',
      'T', 'U', 'V', 'X', 'Y', 'Z'
    ]

    client = Client.new(client_params)
    client.key = keys[rand(24)]

    if client.save
      flash[:success] = 'Cliente cadastrado com sucesso!'
      ClientsMailer.with(client: client).create_client.deliver_later
      redirect_to backoffice_clients_path
    else
      flash[:erro] = 'Erro ao cadastrar o cliente!'
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    id = params[:id]
    client = Client.find(id)

    old_emails = []

    client.emails.each do |e|
      old_emails.append(e.address)
    end

    if client.update(client_params)
      flash[:success] = 'Cadastro do cliente atualizado com sucesso!'

      new_emails = []

      client.emails.each do |e|
        new_emails.append(e.address)
      end

      if new_emails.sort != old_emails.sort
        ClientsMailer.with(client: client).create_client.deliver_later
      end

      redirect_to backoffice_clients_path
    else
      flash[:erro] = 'Erro ao atualizar o cadastro do cliente!'
      render :new
    end
  end

  def destroy
    client = Client.find(params[:id])

    if client.destroy
      flash[:success] = 'Cliente excluído com sucesso!'
      redirect_to backoffice_clients_path
    else
      flash[:erro] = 'Erro ao excluir o cliente!'
      render :index
    end
  end

  def block
    blocking(Client.find(params[:id]))

    redirect_to backoffice_clients_path
  end

  private

  def blocking(client)
    if(client.blocked)
      client.update(blocked: false)
    else
      client.update(blocked: true)
    end
  end

  def client_params
    params.require(:client).permit(:name, :cnpj, :phone, :product, emails_attributes: [:id, :address, :_destroy])
  end
end
