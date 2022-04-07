FROM ubuntu
COPY lab3.cpp .
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN g++ lab3.cpp -static
CMD ./a.out