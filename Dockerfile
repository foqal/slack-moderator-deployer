from node:11-alpine
RUN npm install -g slack-moderator

COPY config /config

user node
cmd slack-moderator --config /config/config.js --rules-config /config/rules.js
