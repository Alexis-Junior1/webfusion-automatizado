Vagrant.configure("2") do |config|
  # Máquina virtual basada en Ubuntu
  config.vm.box = "ubuntu/focal64"
  
  # Redirigimos el puerto para ver la web desde el ordenador local
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Definimos que el script de aprovisionamiento es el archivo provision.sh
  config.vm.provision "shell", path: "provision.sh"
end
