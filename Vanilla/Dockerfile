FROM justcontainers/base

ENV version=1449

ADD "https://terraria.org/api/download/pc-dedicated-server/terraria-server-${version}.zip" /tmp/terraria.zip
RUN \
 apt update && \
 apt-get install -y unzip && \
 unzip /tmp/terraria.zip -d /tmp/terraria && \
 mkdir /TerrariaServer && \
 mv /tmp/terraria/$version/Linux/* /TerrariaServer && \
 mv /tmp/terraria/$version/Windows/serverconfig.txt /TerrariaServer/serverconfig-default.txt && \
 chmod +x /TerrariaServer/TerrariaServer && \
 chmod +x /TerrariaServer/TerrariaServer.bin.x86.64 && \
 # Clean temp files
 apt clean && \
 rm -rf /tmp/*
 
COPY start.sh /TerrariaServer/start.sh

VOLUME [ "/config" ]
 
EXPOSE 7777

WORKDIR /Vanilla
ENTRYPOINT [ "start.sh" ] 