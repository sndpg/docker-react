FROM node:alpine AS build
WORKDIR 'usr/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx AS run 
EXPOSE 80
COPY --from=build /usr/app/build /usr/share/nginx/html