install:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo update
	helm install prometheus prometheus-community/kube-prometheus-stack

upgrade:
	helm upgrade prometheus prometheus-community/kube-prometheus-stack -f custom-values.yaml

pf:
	kubectl port-forward svc/prometheus-operated 9090:9090

run-jobs:
	kubectl apply -f jobs/

get-jobs:
	kubectl get pods -l app=job

watch-jobs:
	kubectl get pods -l app=job -w

del-jobs:
	kubectl delete -f jobs/

uninstall:
	helm delete prometheus