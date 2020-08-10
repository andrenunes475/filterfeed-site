class Client < ApplicationRecord
  has_many :emails, dependent: :destroy

  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true

  private

  def send_confirmation
    ClientsMailer.with(client: self).create_client.deliver_later
  end
end
