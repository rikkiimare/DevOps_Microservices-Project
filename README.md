[![CircleCI](https://dl.circleci.com/status-badge/img/gh/rikkiimare/DevOps_Microservices-Project/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/rikkiimare/DevOps_Microservices-Project/tree/main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
 * Use the following link to find instructions to install [Docker](https://docs.docker.com/engine/install/)

* Setup and Configure Kubernetes locally
 * Use [kubernetes](https://kubernetes.io/docs/tasks/tools/) website to access install procedures for multiple OS type

* Create Flask app in Container
      
      * The steps can be performed by running the shell script below:
         "run_docker.sh"
         OR
      * Confirm kubectl install & version
         kubectl version
      * Build image and add a descriptive tag
         docker build --tag riccardopixel/udacity-build-app:v1 .  
      * Run flask app
         docker run -d -p 8000:80 riccardopixel/udacity-build-app:v1 
      
      confirm access to the app by running < curl localhost:8000 > from a new terminal  
     
* Run via kubectl
  
      * The steps can be performed by running the shell script below:
         "run_kubernetes.sh"
         OR
      * Run docker image within kubernetes
         kubectl run prediction --image=riccardopixel/udacity-build-app:v1 --port=80 --labels app=prediction
      * List kubernetes pods
         kubectl get pods
         # Once pods are in a 'Ready' state  
      * Forward the container port to a host
         kubectl port-forward prediction 8000:80

---

# Files in the Repository

### .circleci/config.yml:
Contains circleci jobs that tests the validity of the build of the flash-app.  The repo links with circleci to automatically run these jobs whenever changes are pushed up to this repo.  At the very top of this README.md file you can find the result of the latest commit.

### docker_out.txt:
Show the output from docker logs and a text grab post running make_prediction.sh

### kubernetes_out.txt:
Standard output to be expected from running run_kubernetes.sh

### app.py:
python script which is provided with data in json format and provides prodictions based on that data.

### Dockerfile:
Dockerfile's content is set up to be able to create a docker build from.

### make_predictions.sh:
Calls the local instance on port 8000.

### Makefile:
Makefile provides steps for building out the solution with setup, install, test & lint parameters.

### requirements.txt:
List of python module/libraries that are required for app.py.

### run_docker.sh:
Script to run through the steps to build a docker image and run the flask-app on port 8000

### run_kubernetes.sh:
Dockerpath provided from the build process in run_docker.sh. - 'docker images' can give you the repository name if required.
Run container in Kubernetes referencing the dockerpath
Once pods are running open up port 8000 to provide access to the app

### upload_docker.sh:
Dockerpath provided from the build process in run_docker.sh. - 'docker images' can give you the repository name if required.
login to Docker
push the Docker image up referencing the Dockerpath.
