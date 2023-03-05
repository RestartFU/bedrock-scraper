FROM archlinux

# disable space check in pacman, so that it works.
RUN sed -i '/CheckSpace/d' /etc/pacman.conf
RUN pacman -Syyu --noconfirm --needed \
    gc gcc crystal shards

COPY . /bin/

RUN \
    cd /bin/ && \
    shards install && \
    crystal build src/main.cr -o .tmp

CMD ["/bin/.tmp"]