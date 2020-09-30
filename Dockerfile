FROM grafana/grafana:7.0.6

LABEL io.k8s.description="Grafana custom on OpenShift" \
      io.k8s.display-name="Grafana Custom" \
      io.openshift.tags="grafana-custom"

ENV GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,alexanderzobnin-zabbix-app
ENV GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=alexanderzobnin-zabbix-datasource

EXPOSE 3000

