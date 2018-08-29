#FROM ubuntu:14.04
FROM python:2.7.10

#RUN apt-get update && \
#    apt-get install -y python python-pip && \
#    apt-get clean all

RUN pip install flask

COPY hello.py /tmp/hello.py

EXPOSE 5001

CMD ["python","/tmp/hello.py"]
