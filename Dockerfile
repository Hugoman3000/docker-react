FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx as production

COPY --from=builder /app/build /usr/share/nginx/html

#CMD ["npm", "start"] or alike not needed since nginx instance is started up automatically by the nginx image