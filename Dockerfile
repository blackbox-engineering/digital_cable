FROM ruby:2.6.6-stretch

RUN apt-get -q update -yqq && apt-get install -yqq --no-install-recommends && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash && \
    apt-get install -yqq nodejs && \
    rm -rf /var/lib/apt/lists/*
RUN npm cache clean -f && npm install -g n && n 12.16.3
RUN npm install --global yarn

RUN useradd --create-home --shell /bin/bash --user-group dev && \
  echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /digital_cable
RUN chown dev:dev /digital_cable
RUN mkdir -p /digital_cable/lib/digital_cable/

USER dev
SHELL ["/bin/bash", "-l", "-c"]
WORKDIR /digital_cable

COPY --chown=dev lib/digital_cable/version.rb /digital_cable/lib/digital_cable/
COPY --chown=dev digital_cable.gemspec /digital_cable/
COPY --chown=dev Gemfile* /digital_cable/
RUN bundle install

COPY --chown=dev package.json /digital_cable/
# COPY --chown=dev yarn.lock /digital_cable/
RUN yarn install --check-files

COPY --chown=dev . /digital_cable/
