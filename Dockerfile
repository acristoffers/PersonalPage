FROM phusion/passenger-ruby24
CMD ["/sbin/my_init"]

EXPOSE 80
EXPOSE 443

# Enables nginx
RUN rm -f /etc/service/nginx/down

# Add nginx configuration
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx-secret.conf /etc/nginx/main.d/nginx-secret.conf

RUN mkdir /home/app/public /home/app/.ssl /home/app/PersonalPage

# Add PublicKey.asc to public static folder
COPY docker/PublicKey.asc /home/app/public/PublicKey.asc

# Add SSL keys
COPY docker/ssl-chained.crt /home/app/.ssl/ssl-chained.crt
COPY docker/ssl.key /home/app/.ssl/ssl.key

# Add Gemfile so we can run bundle before updating the app tree
# This will speed up the image generation in future runs
COPY Gemfile /home/app/PersonalPage/Gemfile
COPY Gemfile.lock /home/app/PersonalPage/Gemfile.lock

RUN chown -R app:app /home/app
RUN chmod -R 775 /home/app
RUN chmod -R 700 /home/app/.ssl

USER app

WORKDIR /home/app/PersonalPage
RUN gem install bundler
RUN bundle

USER root

COPY . /home/app/PersonalPage

RUN chown -R app:app /home/app/PersonalPage
RUN chmod -R 775 /home/app/PersonalPage
