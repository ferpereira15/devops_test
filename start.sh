case "$1" in
  local)
    echo "Você está local"
    ;;
  cloudw)
    echo "Você está na cloud"
    cd terraform/
    terraform init ; terraform plan -var-file=/vars/win.tf ; terraform apply -auto-approve -var-file=windows.tfplan
    ;;
  cloudl)
    echo "Você está na cloud linux"
    cd terraform/
    terraform init ; terraform plan -var-file=/vars/linux.tf ; terraform apply -auto-approve -var-file=linux.tfplan
    ;;
  *)
    echo "Parâmetro inválido. Use 'local' ou 'cloud'."
    ;;
esac