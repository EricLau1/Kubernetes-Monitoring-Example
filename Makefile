up-prom:
	kubectl port-forward svc/prometheus-operated 9090:9090

ls-jobs:
	kubectl get jobs
	kubectl get cronjobs

run-jobs:
	kubectl apply -f jobs/

del-jobs:
	kubectl delete -f jobs/

