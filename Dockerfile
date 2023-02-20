FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
apt-get install -y \ 
net-tools \
xterm \
openbox \
git \ 
x11vnc \
xinit \
openbox menu \
xvfb \
wget \
python3 \
python3-pip \
unzip \
firefox-esr \
geany \
menu && \
pip3 install numpy && \
pip3 install pyxdg && \
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
