class Contact < MailForm::Base
    attribute :name,         :validate => true
    attribute :email,        :validate => true
    attribute :phone,        :validate => true
    attribute :message,      :validate => true
    attribute :nickname,     :captcha  => true

    def headers
        {
            :subject => "[CONTATO]",
            :to => "falecom@filterfeed.com.br",
            :from => %("#{name}" <#{email}>)
        }
    end
end
