# Microsserviço: Tarefas Front-end

Projeto feito para a disciplina de T.E.S.I. (Desenvolvimento de Sistemas de Informação), ministrada  pelo professor Bruno Catão.

Este front-end utiliza um Dockerfile com duas etapas (Stages):
- Build do projeto React
- Serviço estático via NGINX 

## Como utilizar

### 1. `docker build -t tarefas-front .`

Realiza a criação da imagem docker com o nome especificado.

*O titulo definido por `-t tarefas-front` não é obrigatório, se for utiliza-lo deve substituir `tarefas-front` pelo nome desejado, em que tarefas-front é um nome sugerido.*

### 2. `docker run -p {porta_local}:80 {nome_da_imagem}`

Inicia o container, partindo da imagem docker com nome especificado. Deve-se substituir `{nome_da_imagem}` pelo nome do container que foi definido no passo 1.

É possível utilizar as flags `-p` para mapear a aplicação para uma porta específica na sua máquina, a aplicação dentro do container sempre expõe a porta 80, então isso é padrão. Porém, deve-se substituir `{porta_local}` pela porta desejada para permitir o acesso através desta porta em específico.

Exemplo: `docker run -p 3000:80 tarefas-front`\
Nesse exemplo a aplicação estará acessível em: `http://localhost:3000`

## Informações importantes

Devido ao React, ao realizar o build, receber os valores das variáveis de ambiente, e deixar de maneira estática no arquivo HTML gerado, não é possível utilizar a flag `-e` para alterar a URL do Back-end.

Para alterar a URL do Back-end é necessário alterar o Dockerfile.

`URL_BACK_END` é uma variável de ambiente que tem como valor padrão: `http://localhost:5500/tarefas`

## Imagem no Docker HUB

Essa imagem está disponível em: [liviabrito/tarefas-front-end](https://hub.docker.com/r/liviabrito/tarefas-back-end).

