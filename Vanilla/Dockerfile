FROM justcontainers/base

ENV version=1449

COPY start.sh /TerrariaServer/start.sh

ADD "https://terraria.org/api/download/pc-dedicated-server/terraria-server-${version}.zip" /tmp/terraria.zip

RUN \
 apt update && \
 apt-get install -y unzip && \
 unzip /tmp/terraria.zip -d /tmp/terraria && \
 mv /tmp/terraria/$version/Linux/* /TerrariaServer && \
 mv /tmp/terraria/$version/Windows/serverconfig.txt /TerrariaServer/serverconfig-default.txt && \
 chmod +x /TerrariaServer/TerrariaServer && \
 chmod +x /TerrariaServer/TerrariaServer.bin.x86_64 && \
 chmod +x /TerrariaServer/start.sh && \
 # Clean temp files
 rm -rf /tmp/*
 


VOLUME [ "/config" ]
 
EXPOSE 7777

WORKDIR /TerrariaServer
ENTRYPOINT [ "./start.sh" ] 