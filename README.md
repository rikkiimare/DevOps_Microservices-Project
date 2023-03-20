[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rikkiimare/DevOps_Microservices-Project/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/rikkiimare/DevOps_Microservices-Project/tree/main)

## Project Overview

Capstone Project Overview
In this project you will apply the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

Working in AWS
Using Jenkins or Circle CI to implement Continuous Integration and Continuous Deployment
Building pipelines
Working with Ansible and CloudFormation to deploy clusters
Building Kubernetes clusters
Building Docker containers in pipelines
As a capstone project, the directions are rather more open-ended than they were in the previous projects in the program. You will also be able to make some of your own choices in this capstone, for the type of deployment you implement, which services you will use, and the nature of the application you develop.

You will develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. You will also develop your Continuous Integration steps as you see fit, but must at least include typographical checking (aka “linting”). To make your project stand out, you may also choose to implement other checks such as security scanning, performance testing, integration testing, etc.!

Once you have completed your Continuous Integration you will set up Continuous Deployment, which will include:

Pushing the built Docker container(s) to the Docker repository (you can use AWS ECR, create your own custom Registry within your cluster, or another 3rd party Docker repository) ; and
Deploying these Docker container(s) to a small Kubernetes cluster. For your Kubernetes cluster you can either use AWS Kubernetes as a Service, or build your own Kubernetes cluster. To deploy your Kubernetes cluster, use either Ansible or Cloudformation. Preferably, run these from within Jenkins or Circle CI as an independent pipeline.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Propose and Scope the Project
* Use Jenkins or Circle CI, and implement blue/green or rolling deployment
* Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster
* Improve the log statements in the source code for this application
* Build your pipeline
* Test your pipeline


You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/5068/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Existing AWS EKS cluster called udacity-cluster is already running with a blue-svc deployed emulating a live service.

### Green deployment

Green deployment is mocked in the event of a repo push to github.

* Steps involved with circleci build out.
 * build-out
      Installs dependancies
      Performs a lint test on the Dockerfile with hadolint

 * terraform-deploy
      Perform a terraform apply on *.tf file found in the terraform folder.  This created a t2.medium 'deploy-instance' which isused to deploy the green       environment

* assign-ec2-ip
      Obtains the ip of the newly created EC2 Instance
     
* configure-infrastructure
      Uses ansible to run configure-server.yml
      This setup up the EC2 instance ready to be able to communicate with AWS, Docker and the EKS cluster

* deploy-infrastructure
      This copies the relevant files from the repo, connects to the EKS cluster, builds a docker image and exposes that image on port 8000.
      The image is then used to run a pod within the kubernetes cluster.
      The docker image is then pushed to docker hub.
