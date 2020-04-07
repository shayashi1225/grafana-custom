# grafana-custom

## Deploying grafana with zabbix pulgin on OpenShift
1. git clone
```sh
$ git clone https://github.com/shayashi1225/grafana-custom.git
```
2. Deploy grafana on Openshift(4.3.1)
```sh
$ cd grafana-custom/openshift
$ oc new-project grafana-custom
Already on project "grafana-custom" on server "https://api.cluster.example.com:6443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app django-psql-example

to build a new example application in Python. Or use kubectl to deploy a simple Kubernetes application:

    kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node

$ oc project
Using project "grafana-custom" on server "https://api.cluster.example.com:6443".
$  oc create imagestream grafana-custom
imagestream.image.openshift.io/grafana-custom created
$ oc apply -f buildconfig.yaml 
buildconfig.build.openshift.io/grafana-custom created
$ oc start-build grafana-custom
build.build.openshift.io/grafana-custom-1 started
$ oc get is
NAME             IMAGE REPOSITORY                                                                                                      TAGS     UPDATED
grafana-custom   default-route-openshift-image-registry.apps.cluster.example.com/grafana-custom/grafana-custom   latest   10 seconds ago
$ oc new-app grafana-custom
--> Found image a4ec5df (29 seconds old) in image stream "grafana-custom/grafana-custom" under tag "latest" for "grafana-custom"

    Grafana Custom 
    -------------- 
    Grafana custom on OpenShift

    Tags: grafana-custom

    * This image will be deployed in deployment config "grafana-custom"
    * Port 3000/tcp will be load balanced by service "grafana-custom"
      * Other containers can access this service through the hostname "grafana-custom"

--> Creating resources ...
    deploymentconfig.apps.openshift.io "grafana-custom" created
    service "grafana-custom" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/grafana-custom' 
    Run 'oc status' to view your app.
$ oc expose svc/grafana-custom
route.route.openshift.io/grafana-custom exposed
$ oc get route
NAME             HOST/PORT                                                                      PATH   SERVICES         PORT       TERMINATION   WILDCARD
grafana-custom   grafana-custom-grafana-custom.apps.cluster.example.com          grafana-custom   3000-tcp                 None
```
3. access URL exposed by Openshift route and login to grafana (default password admin/admin)
![](images/grafana-login.png)
![](images/grafana-zabbix.png)
