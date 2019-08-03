FROM alpine:latest

RUN apk add cargo
RUN apk add wireguard-tools-wg

RUN cargo install boringtun --git https://github.com/cloudflare/boringtun
RUN mv /root/.cargo/bin/boringtun /bin/
RUN rm -Rf /root/.cargo

RUN mkdir /etc/wireguard

RUN apk add iptables
RUN apk add tcpdump

COPY start /bin/start
RUN chmod +x /bin/start

COPY wg0.conf /etc/wireguard/wg0.conf

CMD ["/bin/start"]
