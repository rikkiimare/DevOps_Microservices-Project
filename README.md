[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rikkiimare/DevOps_Microservices-Project/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/rikkiimare/DevOps_Microservices-Project/tree/main)

# Project Overview

## Capstone Project Overview
This repo provides the terraform scripts needed to setup a simple Blue deployment.  Once this is applied the repo has been connected to circleci as a project and config.yml written to run through various jobs, which simpulate a Green nginx deployment.
You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/5068/view).

## Installation
The following steps create an AWS EKS cluster called udacity-cluster with all the relevant IAM, DNS and EC2 instance around it.

Need to have [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli), [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [minikube](https://minikube.sigs.k8s.io/docs/start/) installed locally
##### Deploy the Blue environment
```sh
git clone https://github.com/rikkiimare/DevOps_Microservices-Project.git
```
Open in favourite code editor
```sh
cd terraform
terraform init
terraform apply
```
Once terraform build out complete run the following to create kubernetes configmap and create the blue-svc service
```sh
aws eks --region us-east-1 update-kubeconfig --name udacity-cluster
kubectl config use-context <aws eks cluster arn....>
kubectl config set-context --current -namespace=udacity
kubectl apply -f index_blue_html.yml
kubectl apply -f index_green_html.yml
kubectl apply -f blue.yml
```

##### Green deployment

Green deployment is mocked in the event of a repo push to github.

* Steps involved with circleci **build-out**.
-- build-out
-- Installs dependancies
-- Performs a lint test on the Dockerfile with hadolint

* **terraform-deploy**
-- Perform a terraform apply on *.tf file found in the terraform folder.  This created a t2.medium 'deploy-instance' which created and used to deploy the green       environment

* **assign-ec2-ip**
-- Obtains the ip of the newly created EC2 Instance
     
* **configure-infrastructure**
-- Uses ansible to run configure-server.yml
-- This setup up the EC2 instance ready to be able to communicate with AWS, Docker and the EKS cluster

* **deploy-infrastructure**
-- This copies the relevant files from the repo, connects to the EKS cluster, builds a docker image and exposes that image on port 8000.
-- The image is then used to run a pod within the kubernetes cluster.
      The docker image is then pushed to docker hub.

## Usage
This repo was created as a Udacity project submission as part of the Cloud-DevOps course. 

## Common Bugs/Issues
None identified so far.

## Contributing
All contributions welcome.

## FAQs
None so far.

## License
MIT
