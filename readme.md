# Getting Started

REF: https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#configuration

## Pré Requisitos

- Install Minikube
- Install Kubectl
- Install Helm

### Start minikube

```bash
minikube start --kubernetes-version=v1.18.20 --cpus 7 --memory 8096
```

### Add Chart for Prometheus

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus-stack prometheus-community/kube-prometheus-stack
```

* How to show services:

```bash
kubectl get services

NAME                                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
alertmanager-operated                       ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   13m
kubernetes                                  ClusterIP   10.96.0.1        <none>        443/TCP                      44m
prometheus-operated                         ClusterIP   None             <none>        9090/TCP                     13m
prometheus-stack-grafana                    ClusterIP   10.98.79.26      <none>        80/TCP                       14m
prometheus-stack-kube-prom-alertmanager     ClusterIP   10.106.222.248   <none>        9093/TCP                     14m
prometheus-stack-kube-prom-operator         ClusterIP   10.107.207.42    <none>        443/TCP                      14m
prometheus-stack-kube-prom-prometheus       ClusterIP   10.104.108.190   <none>        9090/TCP                     14m
prometheus-stack-kube-state-metrics         ClusterIP   10.111.105.2     <none>        8080/TCP                     14m
prometheus-stack-prometheus-node-exporter   ClusterIP   10.103.218.79    <none>        9100/TCP                     14m
```

### Expose Prometheus

```bash
kubectl port-forward svc/prometheus-operated 9090:9090
```


### Show Default Values

```bash
helm show values prometheus-community/kube-prometheus-stack
```

### Create Jobs/CronJobs

```bash
kubectl apply -f jobs/
```

* how to delete jobs:

```bash
kubectl delete -f jobs/
```

###