class Backoffice::WelcomesController < Backoffice::BackofficeController
    before_action :current_welcome, only: [:show, :edit, :update, :destroy, :activate]

    def index
        @welcomes = Welcome.order(active: :desc)
    end

    def show

    end

    def new
        @welcome = Welcome.new
    end

    def create
        welcome = Welcome.create(welcome_params)

        redirect_to backoffice_welcomes_path
    end

    def edit; end

    def update
        @welcome.update(welcome_params)

        redirect_to backoffice_welcomes_path
    end

    def destroy
        @welcome.destroy

        redirect_to backoffice_welcomes_path
    end

    def activate
        @welcome.activate

        redirect_to backoffice_welcomes_path
    end

    private

    def welcome_params
        params.require(:welcome).permit(:content, :active)
    end

    def current_welcome
        @welcome = Welcome.find(params[:id])
    end
end
