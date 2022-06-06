FROM node:16
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json .

RUN npm install
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 30031
CMD [ "npm", "run", "start" ]

HEALTHCHECK --interval=30s --timeout=5s --retries=1 CMD [ "curl -f http://localhost:3000/health || exit 1" ]
