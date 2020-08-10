class DashboardController < ApplicationController
  def show
    id = params[:id]
    id = Base64::urlsafe_decode64(id)
    id = id[18, id.length - 1]
    client = Client.find(id)

    number = 24

    keys = [
      'A', 'B', 'C', 'D', 'E', 'F',
      'G', 'H', 'I', 'J', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S',
      'T', 'U', 'V', 'X', 'Y', 'Z'
    ]

    keys.delete(client.key)
    number = number - 1

    options = [nil, nil, nil, nil, nil, nil, nil, nil, client.key]

    (0..7).each do |i|
      options[i] = keys[rand(number)]
      keys.delete(options[i])
      number = number - 1
    end

    if session[:id].blank?
      session[:id] = id
    end

    if session[:options].blank?
      session[:options] = options.shuffle
    elsif session[:id] != id
      session[:id] = id
      session[:attempts] = 0
      session[:options] = options.shuffle
    end

    @options = session[:options]
    @blocked = client.blocked
    @email = ContactInfo.find_by(active: true).email
  end

  def auth
    id = params[:id]
    id = Base64::urlsafe_decode64(id)
    id = id[18, id.length - 1]
    client = Client.find(id)
    product = client.product
    answer = params[:key]
    key = client.key

    if key == answer
      session[:attempts] = 0

      if product.match?(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)
        product = product.match(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)[1]
      end

      @product = product
    else
      if session[:attempts].blank?
        session[:attempts] = 1
      else
        session[:attempts] = session[:attempts] + 1
      end

      if session[:attempts] > 1
        client.update_attributes(blocked: true, authentication_failed: true)
        ClientsMailer.with(client: client).new_client_pass_link.deliver_later
      end

      redirect_to dashboard_path
    end
  end

  def authentication_failed
    id = params[:id]
    id = Base64::urlsafe_decode64(id)
    id = id[18, id.length - 1]
    client = Client.find(id)

    if client.blocked and client.authentication_failed
      keys = [
        'A', 'B', 'C', 'D', 'E', 'F',
        'G', 'H', 'I', 'J', 'L', 'M',
        'N', 'O', 'P', 'Q', 'R', 'S',
        'T', 'U', 'V', 'X', 'Y', 'Z'
      ]

      client.key = keys[rand(24)]

      session[:options] = nil
      session[:attempts] = 0

      client.update_attributes(blocked: false, authentication_failed: false)
      ClientsMailer.with(client: client).new_client_pass.deliver_later
    else
      redirect_to dashboard_path
    end
  end

  def example
    graph = Graph.find_by(active: true)
    product = graph.product

    if product.match?(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)
      product = product.match(/https:\/\/app.powerbi.com\/view\?r=(\w+)/)[1]
    end

    @product = product
  end
end
