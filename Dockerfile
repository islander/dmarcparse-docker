FROM ubuntu:18.04
ARG PARSER_URL=https://raw.githubusercontent.com/techsneeze/dmarcts-report-parser/master/dmarcts-report-parser.pl
# Install dependencies
RUN apt-get update && apt-get -y install \
    unzip \
    libmail-imapclient-perl \
    libmime-tools-perl \
    libxml-simple-perl \
    libclass-dbi-mysql-perl \
    libio-socket-inet6-perl \
    libio-socket-ip-perl \
    libperlio-gzip-perl \
    libmail-mbox-messageparser-perl && \
    apt-get -y upgrade
# Install parser
RUN apt-get -y install wget && \
    wget -O /usr/local/bin/dmarcts-report-parser.pl $PARSER_URL && \
    chmod +x /usr/local/bin/dmarcts-report-parser.pl && \
    apt-get -y remove wget
# Cleanup
RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
ENTRYPOINT ["/usr/local/bin/dmarcts-report-parser.pl"]
