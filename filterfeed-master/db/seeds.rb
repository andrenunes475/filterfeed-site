# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'victor@filterfeed.com.br', password: 'victor12345!', admin: true)

Graph.create(name: 'Consultoria política de monitoramento e inteligência voltada às relações institucionais e governamentais.', product: '<iframe width="800" height="600" src="https://app.powerbi.com/view?r=eyJrIjoiZDI1YmJjZjYtNjI3Ny00OWM1LWI5ZTgtNTRiMzlkM2Q5N2I4IiwidCI6IjQwZmQ5MDYwLTEwOTQtNDk1Yi04Y2QxLTRlMzc5YjliNzUzMyJ9" frameborder="0" allowFullScreen="true"></iframe>', active: true)

Welcome.create(content: 'A Filterfeed auxilia os maiores <em>players</em> do País a monitorar cenários e gerenciar riscos políticos de suas áreas de interesse, com inteligência e tecnologia.' , active: true)

Anotherservice.create(name: 'Perfis', text: 'Levantamento de dados e <em>background</em> de atores envolvidos em processos decisórios.')
Anotherservice.create(name: 'Proposições', text: 'Acompanhamento de atos normativos que repercutem sobre a atuação de clientes.')
Anotherservice.create(name: 'Tendências', text: 'Insights macro do cenário político, com o objetivo de antecipar tendências regulatórias.')
Anotherservice.create(name: 'Storytelling', text: 'Estruturação de narrativas e argumentos para a defesa de interesses.')

Address.create(address1: 'Brasília, DF', address2: 'Comércio Local Norte 206<br>Bloco A, Loja 3<br>Asa Norte, 70844-510', active: true)
ContactInfo.create(email: 'negocios@filterfeed.com.br', phone: '+55 (61) 4104-4625', active: true)
