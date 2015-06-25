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
