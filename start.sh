case "$1" in
  local)
    echo "Você está local"
    echo "Aguarde um momento. O container será construido com base no Dockerfile e estará disponível em alguns instantes."

    docker build . -t web_app 
    docker run -d -p 8080:8080 web_app --name web_app
    echo "Sua aplicação está disponível no IP 'http://127.0.0.1:8080'!"
    echo 
  ;;

  cloud-windows-deploy)
    echo "Você está na cloud"
    cd terraform/
    terraform init 
    terraform plan -var-file=/vars/windows.tfvars 
    terraform apply -auto-approve -var-file=windows.tfplan
  ;;

  cloud-windows-destroy)
    echo "A infraestrutura provisionada será destruída em alguns instantes"
    cd terraform/
    terraform destroy -auto-approve
    echo "A infraestrutura foi destruída"
  ;;  

  cloud-linux-deploy)
    echo "Você está na cloud linux"
    cd terraform/
    terraform init
    terraform plan -var-file=/vars/linux.tfvars
    terraform apply -auto-approve -var-file=linux.tfplan
  ;;

  cloud-linux-destroy)
    echo "A infraestrutura provisionada será destruída em alguns instantes"
    cd terraform/
    terraform destroy -auto-approve
    echo "A infraestrutura foi destruída"
  ;;  
  *)
    echo "Parâmetro inválido. Use 'local' ou 'cloud'."
  ;;
esac