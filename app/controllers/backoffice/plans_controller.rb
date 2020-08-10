class Backoffice::PlansController < Backoffice::BackofficeController

    def index
        @plans = Plan.order(active: :desc).order(:id)
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)

        if @plan.save
            if @plan.active
                activating(@plan)
            end
            flash[:success] = 'Plano criado com sucesso!'
            redirect_to backoffice_plans_path
        else
            flash[:error] = 'Erro ao criar o plano'
            render :new
        end
    end

    def edit
        @plan = Plan.find(params[:id])
    end

    def update
        @plan = Plan.find(params[:id])

        if @plan.update(plan_params)
            if @plan.active
                activating(@plan)
            end
            flash[:success] = 'Plano atualizado com sucesso!'
            redirect_to backoffice_plans_path
        else
            flash[:error] = 'Erro ao atualizar o plano'
            render :edit
        end
    end

    def destroy
        @plan = Plan.find(params[:id])

        if @plan.destroy
            flash[:success] = 'Plano excluído com sucesso!'
            redirect_to backoffice_plans_path
        else
            flash[:error] = 'Erro ao excluir o plano'
            render :index
        end
    end

    def activate
        activating(Plan.find(params[:id]))

        redirect_to backoffice_plans_path
    end


    private
    def activating(plan)
        if(plan.active)
            plan.update(active: false)
        else
            plan.update(active: true)
        end
    end

    def plan_params
        params.require(:plan).permit(:content, :active)
    end

end
