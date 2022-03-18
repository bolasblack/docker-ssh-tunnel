FROM alpine:3.15
LABEL org.opencontainers.image.authors="c4605 <bolasblack@gmail.com>"

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
-o StrictHostKeyChecking=no \
-NT -L $LOCAL_PORT:$REMOTE_PORT $SSH_REST_OPTS \
&& while true; do sleep 30; done;
EXPOSE 1-65535
