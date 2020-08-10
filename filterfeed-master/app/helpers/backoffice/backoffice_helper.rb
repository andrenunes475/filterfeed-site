module Backoffice::BackofficeHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def breadcrumbs
    controller = {'another_services' => 'Texto (Equipe)', 'services' => 'Produtos', 'members' => 'Equipe', 'graphs' => 'Landing Page', 'clients' => 'Clientes', 'backoffice' => 'Dashboard', 'users' => 'Gerentes', 'welcomes' => 'Texto (Produtos)', 'partners' => 'Parceiros' , 'plans' => "Planos", 'contact_infos' => 'Contato', 'addresses' => 'Endereços'}
    action = {'dashboard' => 'Resultado', 'new' => 'Cadastrar', 'edit' => 'Editar'}
    path = {'backoffice' => backoffice_root_path, 'users' => backoffice_users_path}

    case action_name
    when 'new', 'edit', 'dashboard' then
      breadcrumbs = "<li class='breadcrumb-item'>
                        #{link_to(controller[controller_name], path[controller_name])}
                      </li>"

      breadcrumbs += "<li class='breadcrumb-item active'>
                        #{action[action_name]}
                      </li>"

    else
      breadcrumbs = "<li class='breadcrumb-item active'>
                      #{controller[controller_name]}
                    </li>"

    end

    breadcrumbs.html_safe
  end
end
