FROM ubuntu:latest 



RUN apt update
RUN apt install -y curl wget gnupg vim git

#install spacvim
RUN curl -sLf https://spacevim.org/install.sh | bash 

ENV HELLO="Hello World"
ENV TEST="Test with Yash"

WORKDIR /root
COPY firstscript.sh .
COPY kali.sh .
RUN bash firstscript.sh
RUN rm firstscript.sh 

RUN bash kali.sh 
RUN rm kali.sh 

RUN echo "all good"


