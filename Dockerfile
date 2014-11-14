FROM ytnobody/ubuntu-jp
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update && apt-get install libxml2-dev -y --force-yes
RUN git clone https://github.com/ytnobody/yancha-uncyclopedia-bot.git /bot
WORKDIR /bot

RUN git submodule update --init
RUN cpanm --notest --installdeps .
RUN git submodule foreach cpanm --notest --installdeps .

ENTRYPOINT /bot/worker.pl
