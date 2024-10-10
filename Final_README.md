# DevOps Coding Challenge: EKS Cluster with Nginx Deployment

## Description
his project provides a solution to the G2 DevOps coding challenge. The task involves setting up an AWS EKS cluster using Terraform and deploying an Nginx web server that displays "Welcome to G2". The project also includes a CI/CD pipeline to automate deployments using GitHub Actions.

## Objective
The goal is to deploy a fully functional web server within an AWS EKS cluster, manage infrastructure using Terraform, and automate deployment through CI/CD, while ensuring security best practices and cost optimization

## Challenge Requirements
- Infrastructure as Code: All resources are provisioned using Terraform.
- Kubernetes: Nginx is deployed as a container in the EKS cluster.
- CI/CD Pipeline: GitHub Actions automates the deployment of infrastructure and application updates.
- Security & Cost Optimization: IAM roles with least privilege and cost-efficient instance types are used.

### Project Structure
- `live/main.tf`: Terraform code for EKS and Nginx deployment.
- `workspace/live.tfvars`: Environment-specific Terraform variable file.
- `Jenkinsfile`: Pipeline script for deploying infrastructure with Jenkins.
- `.github/workflows/deploy.yml`: GitHub Actions workflow for automated deployment.

### Requirements
- AWS Account with required IAM permissions.
- Terraform installed locally or configured in the CI/CD pipeline.
- Jenkins or GitHub Actions for automated infrastructure deployment.