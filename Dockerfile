# Our node app is based on `18-alpine` image 
FROM node:18-alpine

# Setting up the environment variables needed:
ENV DOMAIN="http://localhost:3000" \
PORT=3000 \
STATIC_DIR="./client" \
PUBLISHABLE_KEY="pk_test_51NzhV0SJrGtDkLP2e5Zgy01lZWnRiLvlxCI9cJGqxaDzdRSmFGoaEdKzVOH0PYABfGnVQaj4c9NhnAorqNPv8s6Z008jKIznLp" \
SECRET_KEY="sk_test_51NzhV0SJrGtDkLP2VhnCo1m2uGTtil3gcdMXGwVXqDA6e1dc8isC53Whp1m8JaGgBqa34CfqP5JPQNz3DOhhMs9c00VRClSnx8"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
