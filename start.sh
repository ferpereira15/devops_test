case "$1" in
  local)
    echo "Você está local"
    echo "Aguarde um momento. O container será construido com base no Dockerfile e estará disponível em alguns instantes."

    docker build . -t web_app 
    docker run -d --name web_app -p 8080:8080 web_app
    echo "Sua aplicação está disponível no IP 'http://127.0.0.1:8080'!"
    echo 
  ;;
  disable-local)
    echo "O container provisionado será desativado em alguns instantes"
    docker stop web_app
    echo "O container foi desativado com sucesso!"
    echo 
  ;;
  cloud-windows-deploy)
    echo "Você está na cloud"
    cd terraform/
    terraform init 
    terraform plan -var-file=vars/windows.tfvars 
    terraform apply -auto-approve -var-file=windows.tfplan
  ;;

  destroy-cloud-windows)
   echo "A infraestrutura provisionada será destruída em alguns instantes"
   cd terraform/
   terraform destroy -auto-approve -var-file=vars/windows.tfvars
   echo "A infraestrutura foi destruída com sucesso!"
  ;;   

  cloud-linux-deploy)
    echo "Você está na cloud linux"
    cd terraform/
    terraform init
    terraform plan -var-file=vars/linux.tfvars
    terraform apply -auto-approve -var-file=linux.tfplan
  ;;

  destroy-cloud-linux)
    echo "A infraestrutura provisionada será destruída em alguns instantes"
    cd terraform/
    terraform destroy -auto-approve -var-file=vars/linux.tfvars
    echo "A infraestrutura foi destruída com sucesso!"
  ;;  

  *)
    echo "Esse script possui várias opções. Dentre elas:"
    echo
    echo "local - para executar localmente. Lembre-se de iniciar o Docker!"
    echo "disable-local  - para desprovisionar o container criado localmente."
    echo "cloud-windows-deploy  - para executar na cloud a partir de sistema operacional Windows."
    echo "cloud-linux-deploy  - para executar na cloud a partir de sistema operacional Linux."
    echo "destroy-cloud-windows  - para desprovisionar a infraestrutura criada na cloud. É importante para não incorrer custos!" 
    echo "destroy-cloud-linux  - para desprovisionar a infraestrutura criada na cloud. É importante para não incorrer custos!" 

  ;;
esac