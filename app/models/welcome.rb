class Welcome < ApplicationRecord
    def activate
      Welcome.where(active: true).each do |w|
        w.update(active: false)
      end
  
      self.update(active: true)
    end

    def is_active
      if self.active
        return "Ativado"
      else
        return "Desativado"
      end
    end
end
