FROM ubuntu:latest
RUN apt-get update && apt-get -y install cron curl jq

COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob
RUN crontab /etc/cron.d/cronjob
RUN mkdir -p /var/log/cron && touch /var/log/cron/cron.log

COPY script.sh /script.sh
CMD cron && tail -f /var/log/cron/cron.log
