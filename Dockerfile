FROM grafana/grafana

LABEL io.k8s.description="Grafana custom on OpenShift" \
      io.k8s.display-name="Grafana Custom" \
      io.openshift.tags="grafana-custom"

ENV GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,alexanderzobnin-zabbix-app

EXPOSE 3000

