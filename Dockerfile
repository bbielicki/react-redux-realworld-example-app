FROM node as builder

COPY . .
RUN npm install && npm run build


FROM nginx

COPY --from=builder /build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
