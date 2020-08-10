class Backoffice::GraphsController < Backoffice::BackofficeController
  def index
    @graphs = Graph.order(active: :desc).order(:id)
  end

  def new
    @graph = Graph.new()
  end

  def create
    graph = Graph.new(graphs_params)

    if graph.save
      redirect_to backoffice_graphs_path
    else
      render :new
    end
  end

  def edit
    @graph = Graph.find(params[:id])
  end

  def update
    graph = Graph.find(params[:id])

    if graph.update(graphs_params)
      redirect_to backoffice_graphs_path
    else
      render :edit
    end
  end

  def destroy
    graph = Graph.find(params[:id])

    if graph.destroy
      redirect_to backoffice_graphs_path
    else
      render :edit
    end
  end

  def activate
    activating(Graph.find(params[:id]))

    redirect_to backoffice_graphs_path
  end

  private

  def activating(graph)
    if(graph.active)
      graph.update(active: false)
    else
      Graph.all.where(active: true).each do |g|
        g.update(active: false)
      end
      graph.update(active: true)
    end
  end

  def graphs_params
    params.require(:graph).permit(:name, :link, :product, :active)
  end

end
