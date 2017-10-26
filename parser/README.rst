===================
Desafio de programação
===================

Para rodar o app é necessário ruby 2.0+.

Instale a gem bundler:

  gem install bundler

Entre no diretório parser:

  cd parser

Instale as dependências:

  bundle install

Crie o banco de dados:

  rake db:create

Execute as migrações:

  rake db:migrate

Levante o servidor:

  rackup

Acesse a url:

  http://localhost:9292/


Para rodar os testes
===================

Execute as migrações no ambiente de testes:

  RACK_ENV=test rake db:create
  RACK_ENV=test rake db:migrate
