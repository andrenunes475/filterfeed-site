class ClientsMailer < ApplicationMailer
  default from: 'no-reply@filterfeed.com.br'

  def create_client
    client = params[:client]

    @name = client.name
    @url = Base64::urlsafe_encode64("#{client.cnpj}#{client.id}", padding: false)
    @key = "keys/#{client.key}.jpg"

    mail_list = Array.new

    client.emails.each do |email|
      mail_list.push(email.address)
    end

    mail to: mail_list, subject: "#{@name}, sua dashboard ficou pronta!"
  end

  def new_client_pass
    client = params[:client]

    @name = client.name
    @url = Base64::urlsafe_encode64("#{client.cnpj}#{client.id}", padding: false)
    @key = "keys/#{client.key}.jpg"

    mail_list = Array.new

    client.emails.each do |email|
      mail_list.push(email.address)
    end

    mail to: mail_list, subject: "#{@name}, esta é a sua nova insígnia!"
  end

  def new_client_pass_link
    client = params[:client]

    @name = client.name
    @url = Base64::urlsafe_encode64("#{client.cnpj}#{client.id}", padding: false)

    mail_list = Array.new

    client.emails.each do |email|
      mail_list.push(email.address)
    end

    mail to: mail_list, subject: "#{@name}, redefina sua insígnia!"
  end
end
