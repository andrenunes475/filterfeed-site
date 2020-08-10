class Backoffice::ContactInfosController < Backoffice::BackofficeController

    def index
        @contact_infos = ContactInfo.order(active: :desc).order(:id)
    end

    def new
        @contact_info = ContactInfo.new
    end

    def create
        @contact_info = ContactInfo.new(info_params)
        if @contact_info.save
            if @contact_info.active == true
                activating(@contact_info)
            end
            flash[:success] = 'Novo texto salvo com sucesso!'
            redirect_to backoffice_contact_infos_path
        else
            flash[:error] = 'Erro ao salvar o texto!'
            render :new
        end
    end

    def edit
        @contact_info = ContactInfo.find(params[:id])
    end

    def update
        @contact_info = ContactInfo.find(params[:id])

        if @contact_info.update(info_params)
            if @contact_info.active
                activating(@contact_info)
            end
            flash[:success] = 'Texto atualizado com sucesso!'
            redirect_to backoffice_contact_infos_path
        else
            flash[:error] = 'Erro ao salvar o texto'
            render :edit
        end
    end

    def destroy
        @contact_info = ContactInfo.find(params[:id])

        if @contact_info.destroy
            flash[:success] = 'Texto excluído com sucesso!'
            redirect_to backoffice_contact_infos_path
        else
            flash[:error] = 'Erro ao excluir o texto'
            render :index
        end
    end

    def activate
        activating(ContactInfo.find(params[:id]))

        redirect_to backoffice_contact_infos_path
    end

    private

    def activating(info)
        if(info.active)
            info.update(active: false)
        else
            ContactInfo.all.where("active = true").each do |c|
                if c != info
                    c.update(active: false)
                end
            end
            info.update(active: true)
        end
    end

    def info_params
        params.require(:contact_info).permit(:email, :phone, :active)
    end
end
