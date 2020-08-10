class HomeController < ApplicationController

  layout :resolve_layout

  def index
    @welcome = Welcome.find_by(active: true)
    graph = Graph.find_by(active: true)

    if graph.product.match?(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)
      graph.product = graph.product.match(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)[1]
    end

    @graph = graph
    @partners = Partner.where(active: :true)
    @contact = Contact.new
    @contact_info = ContactInfo.find_by(active: true)
    @address = Address.find_by(active: true)
    @members = Member.order(:id)
    @services = Service.order(:id)
    @another_services = Anotherservice.first
  end

  def page2
    @contact = Contact.new
  end

  def resolve_layout
    case action_name
    when 'index'
      'home'
    else
      'page2'
    end
  end

  #controller de welcomes
  # def create
  #    welcome = Welcome.new(welcome_params)
  #   if welcome.active
  #      welcome.activate
  #   end
  #
  # welcome.save
end
