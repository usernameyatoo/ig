FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN npm i
CMD npm run dev
