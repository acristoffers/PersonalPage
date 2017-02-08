#!/usr/bin/env bash

source docker/env.sh

cat > docker/service.yml << EOM
apiVersion: v1
kind: Service
metadata:
  name: $IMAGE_ID-service
spec:
  type: LoadBalancer
  loadBalancerIP: $STATIC_IP
  ports:
    - port: 80
      name: "http"
    - port: 443
      name: "https"
  selector:
    name: $IMAGE_ID-pod
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: $IMAGE_ID-deployment
spec:
  replicas: 1
  revisionHistoryLimit: 3
  template:
    metadata:
      labels:
        name: $IMAGE_ID-pod
    spec:
      containers:
        - name: $IMAGE_ID
          image: gcr.io/$PROJECT_ID/$IMAGE_ID:$IMAGE_VERSION
          ports:
            - containerPort: 80
            - containerPort: 443
EOM
