class Backoffice::BackofficeController < ApplicationController
  before_action :authenticate_user!

  layout 'backoffice/backoffice'

  def index
    redirect_to backoffice_graphs_path
  end

  def dashboard
    url = params[:encode][:url]
    if url.match?(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)
      url = url.match(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)[1]
      url = Base64::urlsafe_encode64(url, padding: false)
      @url_encoded = dashboard_url(url)
    else
      redirect_to backoffice_root_path
    end
  end

  private

  def authenticate_admin!
    redirect_to backoffice_root_path unless current_user.admin
  end
end
