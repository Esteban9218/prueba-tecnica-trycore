# Etapa 1: Construcción de la aplicación Angular
FROM node:20-alpine AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el código del proyecto al contenedor
COPY . .

# Construir la aplicación Angular en modo producción
RUN npm run build -- --output-path=dist

# Etapa 2: Servir la aplicación con Nginx
FROM nginx:latest

# Copiar los archivos generados en la etapa de construcción al servidor Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto en el que correrá la aplicación
EXPOSE 8083

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
