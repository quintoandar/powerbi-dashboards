FROM node:boron

WORKDIR /opt/current-app

ADD . .
RUN apt-get update -y
RUN apt-get install -y python-pip python2.7 python2.7-dev
RUN npm install
# this is needed for bower to work
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN npm run bower_install
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python", "app.py"]

EXPOSE 5000