# Preview all emails at http://localhost:3000/rails/mailers/clients_mailer
class ClientsMailerPreview < ActionMailer::Preview
  def create_client_preview
    ClientsMailer.with(client: Client.first).create_client
  end
end
