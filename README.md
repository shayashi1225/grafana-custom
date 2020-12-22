# OpenShift - Zabbix Integration Demo
主にインフラ担当者向けにOperatorの動きを見せつつ、監視として非常に多く採用されている既存のZabbixとの連携をOpenShift上でデモする。

構築する構成はこちら  
![ocp-zabbix_overview](images/ocp-zabbix_demo_overview.png)

## Preparement
- OCP demo environment (ex. RHPDS - OpenShift 4.6 Workshop)

## Instructions

1. [Install EAP Application](InstallEAP.md)   
As datasource for importing Prometheus. (Using JMX export)

2. [Install Prometheus](InstallPrometheus.md)  
Install Promethus as **user** metrics datastore (Not Cluster metrics) using Operator.  

3. [Install Zabbix](InstallZabbix.md)  
Instead of external zabbix, install Zabbix on OpenShift for demonstration. Normally, integrate Prometheus on OpenShift with Zabbix already running.

4. [Install Grafana and display zabbix data](InstallGrafana.md)  
Zabbix UI is not usefull a little bit when display graph. Grafana has very flexible UI, and so better tha display Zabbix data using Grafana.  

5. [Integration Prometheus and Zabbix](IntegrationZabbix.md)  
Integration Promethus (Exporter) and Zabbix.








