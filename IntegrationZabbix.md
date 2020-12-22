## 5. Integration Prometheus and Zabbix

### 5−1. Zabbixコンソールへログインして、新規hostを作成
![zabbix_create_hosts](images/zabbix_create_hosts.png)
- Name: user-prometheus(任意)
- Group: OpenShift(任意)
### 5-2. item1 - Metrics全体を取得するitem を作成
![zabbix_create_item1_1](images/zabbix_create_item1_1.png)
![zabbix_create_item1_2](images/zabbix_create_item1_2.png)

- Name: prometheus(任意)
- Type: [HTTP agent]
- Key: jmx-monitor-user1(任意)
- URL: http://< JMX Exporter のroute >/metrics
- Timeout: 30s -->データが多すぎるとタイムアウトするため、最初は長めにして実機で要調整
- History storage period: [Do not keep History] 

### 5−3. item2 - Metricsを抽出するitem を作成
![zabbix_create_item2_1](images/zabbix_create_item2_1.png)

- Name: jvm_memory_bytes_used(任意)
- Type: [Depeemdemt item]
- Key: jmx-monitor-user1_jvm_used(任意)
- Master item: [user-prometheus: prometheus] -->ホスト名: item1名  
- Type of information: [Numeric(float)] -->抽出するデータの型


このitemのprocessingで、抽出条件を定義する
![zabbix_create_item2_2](images/zabbix_create_item2_2.png)
- Name: [Prometheus pattern]
- Parameters: jvm_memory_bytes_userd{area="heap"} -->取得したいメトリクスを登録

![prometheus_display_query](images/prometheus_display_query.png)

item2は、Zabbixへ連携したいメトリクスを必要な分だけ定義していく。
![zabbix_list_items](images/zabbix_list_items.png)

### 5-4. Zabbix上でPrometeus Exporterから取得したデータを表示する
![zabbix_display_graph](images/zabbix_display_graph.png)


[トップへ戻る](Readme.md)