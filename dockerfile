FROM steamcmd/steamcmd:ubuntu-24

RUN apt-get update -y \
    && add-apt-repository multiverse; apt update \
    && apt-get install -y \
    lib32gcc-s1 \
    libicu-dev \
    && mkdir ${HOME}/data

ENV STEAMAPPDIR="/root/data"
ENV CONFIGDIR="/root/.config/SCP Secret Laboratory"

RUN steamcmd +force_install_dir "${STEAMAPPDIR}" +login anonymous +app_update 996560 +app_update 996560 validate +quit

EXPOSE 7777

VOLUME [ "${CONFIGDIR}"]

VOLUME [ "${STEAMAPPDIR}" ]

WORKDIR /root/data

COPY ./scripts/start /

ENTRYPOINT [ "/start" ]