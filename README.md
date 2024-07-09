
# Coding Challenge: Deploying a Web Server in AWS EKS

## Description
Welcome to the G2 DevOps coding challenge! This challenge is designed to assess your ability to deploy and manage a web server in a cloud environment using modern DevOps tools and practices. You will create a running web server that displays "Welcome to G2" when accessed via a web browser. The challenge involves setting up an Nginx container within an EKS (Elastic Kubernetes Service) cluster on AWS, managing infrastructure as code with Terraform, and implementing a CI/CD pipeline using GitHub Actions for automated deployments.

## Objective
Create a running web server that displays "Welcome to G2" when accessed via a web browser.

## Challenge Requirements
1. **Web Server URL:**
   - The web server should be accessible at: `https://devops.sandbox.siftery.com`

2. **Deployment Environment:**
   - The web server must run in an Nginx container within an EKS (Elastic Kubernetes Service) cluster on AWS.
   
3. **Infrastructure as Code:**
   - All AWS and EKS resources should be provisioned using Terraform.

4. **Continuous Deployment:**
   - Implement automated deployment of code changes to AWS using GitHub Actions.

5. **Security and Cost Optimization:**
   - Ensure that security best practices and cost optimization strategies are applied throughout the solution.

6. **Real-Time Content Updates:**
   - Demonstrate the ability to update the web page content in real-time by modifying the code in the GitHub repository.

## Access Provided
1. **AWS Account:**
   - Read-only access to the G2 Sandbox AWS account console.

2. **GitHub Repository:**
   - Admin access to the GitHub repository named `devops-interview`.
   - The repository will contain AWS keys stored as secrets.

## Steps to Complete the Challenge
1. **Set Up EKS Cluster:**
   - Use Terraform to create an EKS cluster in AWS.
   
2. **Configure Nginx Web Server:**
   - Deploy an Nginx container in the EKS cluster that serves the "Welcome to G2" page.
   
3. **Automate Infrastructure Deployment:**
   - Ensure all infrastructure (EKS, networking, IAM roles, etc.) is managed and deployed using Terraform scripts.
   
4. **Implement CI/CD Pipeline:**
   - Set up GitHub Actions to automatically deploy changes to the Nginx web server in AWS.
   
5. **Security and Cost Management:**
   - Apply best practices for securing AWS resources and optimizing costs, such as using IAM roles with least privilege, enabling logging and monitoring, and selecting cost-effective instance types.
   
6. **Real-Time Content Update:**
   - Modify the web page content in the GitHub repository and demonstrate that changes are automatically reflected on the web server.

## Resources
- G2 Sandbox AWS account (read-only access)
- `devops-interview` GitHub repository (admin access with AWS keys stored as secrets)

By following these steps, you will demonstrate your ability to set up and manage a scalable, secure, and cost-effective web server infrastructure in AWS, leveraging modern DevOps practices and tools. This challenge will test your proficiency in Terraform, Kubernetes, AWS, CI/CD pipelines, and best practices in security and cost management.
