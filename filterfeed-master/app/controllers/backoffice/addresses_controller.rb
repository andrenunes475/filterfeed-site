class Backoffice::AddressesController < Backoffice::BackofficeController

    def index
        @addresses = Address.order(active: :desc).order(:id)
    end

    def new
        @address = Address.new
    end

    def create
        @address = Address.new(address_params)

        if @address.save
            if @address.active
                activating(@address)
            end
            flash[:success] = 'Texto criado com sucesso!'
            redirect_to backoffice_addresses_path
        else
            flash[:error] = 'Erro ao criar o texto'
            render :new
        end
    end

    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])

        if @address.update(address_params)
            if @address.active
                activating(@address)
            end
            flash[:success] = 'Texto atualizado com sucesso!'
            redirect_to backoffice_addresses_path
        else
            flash[:error] = 'Erro ao atualizar o texto'
            render :edit
        end
    end

    def destroy
        @address = Address.find(params[:id])

        if @address.destroy
            flash[:success] = 'Texto excluído com sucesso!'
            redirect_to backoffice_addresses_path
        else
            flash[:error] = 'Erro ao excluir o texto'
            render :index
        end
    end

    def activate
        activating(Address.find(params[:id]))

        redirect_to backoffice_addresses_path
    end


    private
    def activating(address)
        if(address.active)
            address.update(active: false)
        else
            Address.all.where("active = true").each do |a|
                if a != address
                    a.update(active: false)
                end
            end
            address.update(active: true)
        end
    end

    def address_params
        params.require(:address).permit(:address1, :address2, :active)
    end
end
