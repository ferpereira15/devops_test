# devops_test

## Introdução

Esse projeto é sobre um desafio proposto para uma vaga de DevOps. Ele tem como objetivo demonstrar a utilização das ferramentas Docker, Terraform e Shell Script na automatização de processos onerosos de provisionamento de containers e infraestrutura para uma aplicação.
O desafio consiste em  disponibilizar de forma "automágica" uma aplicação web (um simples "Hello World"), utilizando poucos ou nenhum comando para isso. 
Qualque melhoria, crítica e sugestões, serão sempre bem-vindas!

## Requisitos

- Acesso à internet (para deploy na cloud);
- AWS CLI instalada em sua máquina e configurada com um profile nomeado "terraform". Se por acaso precisar de ajuda na instalação, consulte o link abaixo:
    - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html 

- Docker Community Edition instalado. Se por acaso precisar de ajuda na instalação, consulte o link abaixo:
    - https://docs.docker.com/get-docker/

- Terraform instalado. Se por acaso precisar de ajuda na instalação, consulte o link abaixo:
    -  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

- Git Bash ou similares para execução do Shell Script em ambientes Windows, caso esse seja seu sistema operacional. Se estiiver utilizando sistemas Linux, MacOS ou Unix, basta seguir diretamente para "Como Usar". Se por acaso precisar de ajuda na instalação, consulte o link: 
    - https://gitforwindows.org/

## Como usar

Inicie o Docker Desktop antes de tudo.
Se estiver utilizando Docker no Windows, utilize containers Linux.

### Para uso Local

Acesse o diretório do projeto via terminal (Git Bash ou similares).
Digite o comando abaixo para iniciar o script:

```sh
./start.sh local
```
Agora é só acessar o browser de sua preferência e digitar na barra de endereços, o IP retornado no terminal!

### Para desprovisionamento do container Docker

Acesse o diretório do projeto via terminal.
Digite o comando abaixo para iniciar o script:

```sh
./start.sh disable-local
```

Pronto! O container provisionado será parado.

### Para deploy na cloud AWS

Para o correto funcionamento na AWS, é necessário informar no código-fonte o diretório em que os arquivos de credenciais e configurações estão. O caminho geralmente é: "C:/Users/[SEU USUÁRIO]/.aws/[credentials][config]
Para realizar o apontamento, abra com um editor de texto o arquivo "provider.tf" que se encontra no diretório /terraform/provider.tf e subistitua os valores de "shared_credentials_files" e "shared_config_files", e pronto! Agora é só seguir os passos abaixo.

Acesse o diretório do projeto via terminal (Git Bash ou similares).
Digite o comando abaixo para iniciar o script:

```sh
./start.sh cloud-windows 
```

Agora é só acessar o browser de sua preferência e digitar na barra de endereços o IP retornado no terminal!

### Para desprovisionamento da Infraestrura na Cloud - Windows

Acesse o diretório do projeto via terminal.
Digite o comando abaixo para iniciar o script:

```sh
./start.sh destroy-cloud-windows
```
Pronto! A infraestrutura provisioonada será destruída.
É importante realizar esse passo, caso contrário, sua infraestrutura vai gerar custos.

## Recursos criados na cloud

- Instância EC2 de tamanho t2.nano
- VPC
- Internet Gateway
- Subnet Pública
- Subnet Privada
- Route Table Pública
- Rotas - pública e privada
- Associação de rotas
- EIP (elastic IP)
- NAT Gateway
- Security Groups 


