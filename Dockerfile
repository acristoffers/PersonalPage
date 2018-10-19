FROM phusion/passenger-ruby24

EXPOSE 80
EXPOSE 443

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update && apt-get dist-upgrade -y && apt-get install yarn nodejs -y

# Enables nginx
RUN rm -f /etc/service/nginx/down

# Add nginx configuration
COPY docker/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /home/app/public /home/app/.ssl /home/app/PersonalPage

# Add PublicKey.asc to public static folder
COPY docker/PublicKey.asc /home/app/public/PublicKey.asc

# Add SSL keys
COPY docker/ssl-chained.crt /home/app/.ssl/ssl-chained.crt
COPY docker/ssl.key /home/app/.ssl/ssl.key

RUN chown -R app:app /home/app
RUN chmod -R 775 /home/app
RUN chmod -R 700 /home/app/.ssl

COPY . /home/app/PersonalPage

WORKDIR /home/app/PersonalPage/webapp
RUN yarn
RUN yarn run webpack
WORKDIR /home/app/PersonalPage
RUN mkdir dist
RUN cp -r webapp/assets assets
RUN cp -r webapp/dist/*.js dist/
RUN cp -r webapp/index.html .
RUN rm -r docker webapp Dockerfile

RUN chown -R app:app /home/app/PersonalPage
RUN chmod -R 775 /home/app/PersonalPage

CMD ["/sbin/my_init"]
