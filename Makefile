install:
	helm install prometheus-stack prometheus-community/kube-prometheus-stack

upgrade:
	helm upgrade prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml

serve:
	kubectl port-forward svc/prometheus-operated 9090:9090

run-jobs:
	kubectl apply -f jobs/

get-jobs:
	kubectl get pods -l app=job

watch-jobs:
	kubectl get pods -l app=job -w

del-jobs:
	kubectl delete -f jobs/

