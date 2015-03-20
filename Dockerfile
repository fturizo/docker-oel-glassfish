# We start using my custom Oracle Linux with Oracle JDK image
FROM fturizo/oel-java

MAINTAINER Fabio Turizo <fabio.turizo@gmail.com>

COPY  delete-dfdomain.sh delete-dfdomain.sh
COPY  domain-creation.sh domain-creation.sh
COPY  int-domain-creation.sh int-domain-creation.sh
COPY  run.sh /run.sh

ENV   PATH /opt/glassfish4/bin:$PATH

RUN   useradd glassfish && \
      yum install -y wget unzip expect && \
      wget http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
      unzip glassfish-4.1.zip && \
      mv glassfish4/ /opt/ && \
      chown glassfish:glassfish -R /opt/glassfish4 && \
      rm -f glassfish-4.1.zip && \

      su - glassfish && \
      chmod +x *.sh; sleep 1 && \
      ./delete-dfdomain.sh

RUN   ./domain-creation.sh

EXPOSE 4848 8080

CMD   ["/run.sh"]
