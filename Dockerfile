# build environment
FROM node as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# production environment
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
