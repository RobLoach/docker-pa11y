# pa11y-dashboard Docker Container
# https://github.com/springernature/pa11y-dashboard
FROM node:4
MAINTAINER Rob Loach <robloach@gmail.com>

# Environment variables
ENV NODE_ENV ${NODE_ENV:-production}
ENV PA11Y_VERSION 1.8.2
ENV PA11Y_PORT ${PORT:-80}
ENV PA11Y_NOINDEX ${PA11Y_NOINDEX:-true}
ENV PA11Y_READONLY ${PA11Y_READONLY:-false}
ENV PA11Y_SITEMESSAGE ${PA11Y_SITEMESSAGE:-"Welcome to pa11y"}
ENV PA11Y_WEBSERVICE_DATABASE ${PA11Y_WEBSERVICE_DATABASE:-mongodb://mongodb/pa11y-webservice}
ENV PA11Y_WEBSERVICE_HOST ${PA11Y_WEBSERVICE_HOST:-0.0.0.0}
ENV PA11Y_WEBSERVICE_PORT ${PA11Y_WEBSERVICE_PORT:-3000}
ENV PA11Y_WEBSERVICE_CRON ${PA11Y_WEBSERVICE_CRON:-"0 30 0 * * *"}

# Dependencies
RUN npm install phantomjs-prebuilt -g

# Retrieve the dashboard
RUN git clone --branch $PA11Y_VERSION https://github.com/springernature/pa11y-dashboard.git

# Install dependencies
RUN cd pa11y-dashboard && npm i

# Set up the startup script.
COPY start.sh /
ENTRYPOINT ["sh", "/start.sh"]
