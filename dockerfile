FROM steamcmd/steamcmd:ubuntu-24

#COPY ./scripts/setup-user.sh .

RUN apt-get update -y \
    && add-apt-repository multiverse; apt update \
    && apt-get install -y \
    lib32gcc-s1 \
    libicu-dev \
    && mkdir ${HOME}/data
#    && /bin/sh setup-user.sh

#ENV username=scpserver
ENV STEAMAPPDIR="${HOME}/data"
ENV CONFIGDIR="${HOME}/.config/SCP Secret Laboratory"
#ENV USERHOME="/home${username}"

RUN steamcmd +force_install_dir "${STEAMAPPDIR}" +login anonymous +app_update 996560 +app_update 996560 validate +quit

#USER ${username}

EXPOSE 7777

VOLUME [ "${CONFIGDIR}"]

VOLUME [ "${STEAMAPPDIR}" ]

WORKDIR ${HOME}

#COPY --chown=${username}:${username} --chmod=744 ./scripts/start ${USERHOME}
COPY ./scripts/start /

ENTRYPOINT [ "/start" ]