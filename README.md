# Implantação automatizada

Para instalar o Espelho Político em uma máquina virtual local, através do Vagrant, basta seguir os seguintes passos:

1. Instalar o VirtualBox (https://www.virtualbox.org/wiki/Downloads)
2. Instalar o Vagrant (https://www.vagrantup.com/downloads.html)
3. Instalar o plugin vagrant-omnibus (vagrant plugin install vagrant-omnibus)
4. Baixar a imagem base (vagrant box add ubuntu/trusty64)

* Criar máquina virtual:
$ vagrant up

**Pronto!**

* Se quiser reexecutar a receita ou em caso de erro na criação da VM:
$ vagrant provision


* Para entrar na máquina virtual:
$ vagrant ssh

#Instalação Jenkins

Seguir até o passo 10 do tutorial

http://www.webascender.com/Blog/ID/522/Setting-up-Jenkins-for-GitHub-Rails-Rspec#.VYs90_lVikp

no passo 9 instalar:

1. sudo apt-get install mysql-client libmysqlclient-dev
2. sudo apt-get install libsqlite3-dev
3. sudo apt-get install rake 

Depois logar com o usuário:

* usuario: admin
* senha: jenkins
* nome: Jenkins

Comando do shell:

* cp config/database.jenkins.yml config/database.yml
* bundle install
* rake db:create --trace
* RAILS_ENV=test bundle exec rake db:migrate --trace
* bundle exec rspec

