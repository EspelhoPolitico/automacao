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

#Instalação do Jenkins

1. Instalar o Jenkins:

$ wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
$ sudo apt-get update
$ sudo apt-get install jenkins

2. Logar como um usuário Jenkins:
$ sudo su - jenkins

3. Criar um arquivo com o nome .config na pasta raiz (/var/lib/jenkins):

[user]
  name = Jenkins
  email = jenkins@localhost

4. Entrar em  http://localhost:8080:
* Vá em “Gerenciar Jenkins” depois “Gerenciar Plugins”
* Na aba “Disponível”, procure e selecione os plugins: git, gitHub, rbenv e rake
* Pressione o botão 'Baixar agora, instalar e depois reiniciar'
* Volte para  “Gerenciar Jenkins” e selecione “Configurações de Segurança”
* Nesta página, selecione “Habilitar segurança”, depois “Base de dados interna do Jenkins” 
* Depois, selecione “Project-based Matrix Authorization Strategy”
* A partir dai, adicione os usuários “admin” e “github”, selecione todas as permissões pro admin e apenas o “Read” pro github
* Clique em "salvar"
* O sistema irá reiniciar, então vá em criar nova conta
* Crie um usuário com as seguintes especificações:

usuario: admin,
senha: jenkins,
nome: Espelho Politico,
email: "coloque o seu email"

* Vá em "Gerenciar Jenkins", depois "Gerenciar Usuários" e crie o usuário “github”
* Volte para a página principal, clique em “Novo job”, selecione “Build a free-style software project” e “OK"
* Preencha os campos “Nome do projeto” e “Projeto no GitHub”
* Embaixo de “Gerenciamento de código fonte”, selecione “Git” e adicione o link do repositório
* Selecione a caixa “rbenv build wrapper”
* Embaixo de “Adicionar passos da build”, selecione “Execute shell”. Escreva o seguinte comando de shell:

$ cp config/database.jenkins.yml config/database.yml
$ bundle install
$ rake db:create --trace
$ RAILS_ENV=test bundle exec rake db:migrate --trace
$ bundle exec rspec

**Pronto!**

Qualque dúvida: http://www.webascender.com/Blog/ID/522/Setting-up-Jenkins-for-GitHub-Rails-Rspec#.VYwOxOnd88q

