FROM node:18-alpine AS build

WORKDIR /app

COPY . .

CMD ["npm", "run", "build"]

FROM nginx:1.15

COPY --from=build /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
