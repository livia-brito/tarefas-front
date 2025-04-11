# Stage 1: fazer build da aplicação
FROM node:23-slim as builder

# Define pasta de trabalho onde ficarão os arquivos
WORKDIR /app

# Tira proveito do sistema incremental
# Baixa dependências
COPY package*.json ./
RUN npm install

# Copia o restante do projeto
COPY . .

# Variável de ambiente para o back-end 
ENV URL_BACK_END="http://localhost:5500/tarefas"

# Cria os arquivos estáticos otimizados 
RUN npm run build

# Stage 2: Usar NGINX para gerenciar o front-end
FROM nginx:1.27.4

# Copia o build do React para a pasta que o NGINX serve
COPY --from=builder /app/build /usr/share/nginx/html

# Expõe a porta para acesso
EXPOSE 80

# Inicia o nginx ao inicializar o container
CMD ["nginx", "-g", "daemon off;"]
