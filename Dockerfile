# Get Base Docker Image
FROM node:alpine as builder

# Install additional files
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
# bootup command

#CMD ["npm","run","build"]

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html