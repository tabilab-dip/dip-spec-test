# NOT COMPLETE

FROM ubuntu:16.04
RUN apt-get -y update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.7 -y
RUN apt-get install python3-pip -y
RUN python3.7 -m pip install pip --upgrade
RUN python3.7 -m pip install wheel

COPY . /server
WORKDIR /server
RUN python3.7 -m pip install -r requirements.txt
RUN python3.7 -m pip install .
#CMD ["gunicorn", "-w", "2", "--chdir",  "./morphological_parser/", "api:app", "-b", "0.0.0.0:4444"]
# gunicorn -w 2 --chdir ./morphological_parser/ api:app -b 0.0.0.0:4444
#CMD "/server/start_gunicorn.sh"
CMD "while true; do echo hello; done"
