FROM archlinux

# disable space check in pacman, so that it works.
RUN sed -i '/CheckSpace/d' /etc/pacman.conf
RUN pacman -Syyu --noconfirm --needed gc

ENV ADDR=192.168.2.157
ENV PORT=8234

COPY .tmp /bin/

CMD ["/bin/.tmp"]