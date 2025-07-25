#!/bin/bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  --set installCRDs=true

kubectl create -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
