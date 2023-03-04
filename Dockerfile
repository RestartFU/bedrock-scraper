FROM archlinux

# disable space check in pacman, so that it works.
RUN sed -i '/CheckSpace/d' /etc/pacman.conf
RUN pacman -Syyu --noconfirm --needed gc

COPY main /bin/

CMD ["/bin/main"]