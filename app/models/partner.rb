class Partner < ApplicationRecord
    has_one_attached :avatar

    def activate
        if self.active
            self.update(active: false)
        else
            self.update(active: true)
        end
    end

    def is_active
        if self.active
            return "Ativado"
        else
            return "Desativado"
        end
    end
end
