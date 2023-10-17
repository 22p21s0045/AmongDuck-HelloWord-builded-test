FROM node:16 AS stage1
COPY ./ /nodeproj/
WORKDIR /nodeproj/
RUN npm install --global webpack
RUN yarn
RUN yarn deploy
FROM nginx:alpine
COPY --from=stage1 /nodeproj/build /usr/share/nginx/html/
