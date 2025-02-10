# Node.js App
FROM node:16 AS node
WORKDIR /app
COPY node-app/package.json .
RUN npm install
COPY node-app .
CMD ["npm", "start"]
EXPOSE 3000

# Python Flask App
FROM python:3.9 AS python
WORKDIR /app
COPY python-app/requirements.txt .
RUN pip install -r requirements.txt
COPY python-app .
CMD ["python", "app.py"]
EXPOSE 5000
