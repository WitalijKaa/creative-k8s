FROM apache/kafka:4.1.1

USER root
COPY init.sh /kafka/init.sh
RUN chmod +x /kafka/init.sh

ENTRYPOINT ["/kafka/init.sh"]
