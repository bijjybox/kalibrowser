FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
apt-get install -y \ 
net-tools \
openbox \
git \ 
x11vnc \
xvfb \
wget \
python3 \
python3-pip \
unzip \
iceweasel \
geany \
menu && \
pip3 install numpy && \
cd /root && git clone https://github.com/kanaka/noVNC.git && \
cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
cd /root
ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh && \
apt-get autoremove && \
rm -rf /var/lib/apt/lists/*

#The Kali Docker Image Is Out Of Date. : (
RUN apt-get update -y && apt-get dist-upgrade -y

CMD /startup.sh
