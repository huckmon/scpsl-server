FROM steamcmd/steamcmd:ubuntu-24

ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

RUN apt-get update \
    && mkdir /home/data \
    && add-apt-repository multiverse; apt update \
    && apt-get install -y \
        lib32gcc-s1 \
        unzip \
        libicu-dev \

RUN steamcmd +force_install_dir "/home/data" +login anonymous +app_update 996560 +app_update 996560 validate +quit

USER ${USER}

RUN cd /home/data

EXPOSE 7777

VOLUME [ "/root/.config/SCP Secret Laboratory"]

VOLUME [ "/data" ]

WORKDIR /home/data

COPY ./scripts/start /

ENTRYPOINT [ "/start" ]