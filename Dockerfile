FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build is where the files we want are

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

