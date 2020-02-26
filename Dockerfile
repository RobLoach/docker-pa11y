FROM node:12

RUN apt-get update -y && apt-get upgrade -y && apt-get install net-tools -y && apt-get install gconf-service libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxss1 libxtst6 libappindicator1 libnss3 libasound2 libatk1.0-0 libc6 ca-certificates fonts-liberation lsb-release xdg-utils wget -y

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
USER node

WORKDIR /home/node/app
RUN git clone https://github.com/pa11y/pa11y-dashboard.git && cd pa11y-dashboard && npm i

EXPOSE 4000
EXPOSE 3000

WORKDIR /home/node/app/pa11y-dashboard
COPY production.json ./config/production.json

CMD NODE_ENV=production node index.js

# add a volume for mongo storage or replace with cloud
# mongodb://pallespm:upmc123@ds047315.mlab.com:47315/oddessentials