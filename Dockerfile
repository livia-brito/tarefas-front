FROM node:23

# Definir pasta padrão para a aplicação no container
WORKDIR /app

# Tira proveito do sistema incremental
# Baixa dependências
COPY ./package*.json ./
RUN npm install

# Copia arquivos locais para o WORKDIR
COPY ./ ./

# Configuração por variável de ambiente
ENV URL_BACK="http://localhost:5500/tarefas"

# Expõe porta para acesso da aplicação
EXPOSE 3000

# Comando executado ao iniciar container (inicia a aplicação)
CMD ["npm", "start"]
