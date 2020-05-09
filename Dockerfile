FROM ubuntu:trusty
COPY . ~/app
WORKDIR ~/app
CMD ["perl", "ttt.pl"]
