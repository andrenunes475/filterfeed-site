class Backoffice::PartnersController < Backoffice::BackofficeController
    before_action :current_partner, only: [:show, :edit, :update, :destroy, :activate]

    def index
        @partners = Partner.order(active: :desc)
    end

    def show

    end

    def new
        @partner = Partner.new
    end

    def create
        partner = Partner.create(partner_params)

        redirect_to backoffice_partners_path
    end

    def edit; end

    def update
        @partner.update(partner_params)

        redirect_to backoffice_partners_path
    end

    def destroy
        @partner.destroy

        redirect_to backoffice_partners_path
    end

    def activate
        @partner.activate

        redirect_to backoffice_partners_path
    end

    private

    def partner_params
        params.require(:partner).permit(:name, :avatar, :active)
    end

    def current_partner
        @partner = Partner.find(params[:id])
    end

end
