[![CircleCI](https://circleci.com/gh/donkodimov/ml-microservice-kubernetes.svg?style=shield)](https://circleci.com/gh/donkodimov/ml-microservice-kubernetes)

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

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
4. Make prediction(Docker): `./make_prediction.sh`



## Kubernetes Steps on Linux


### Install Minikuber single-node cluster:

* Check if virtualization is supported:
```
grep -E --color 'vmx|svm' /proc/cpuinfo
```

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

* Install Minikube via direct download:
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
```

* Add the Minikube executable to your path:

```
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
```

* Start up a local Kubernetes cluster:
```
minikube start --driver=virtualbox
minikube status
```
Expected output:
```
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### Running and expose Deployment in Kubernetes

1. Run the deployment: `kubectl apply -f prediction-deployment.yaml`
2. Run the service: `kubectl apply -f prediction-service.yaml`
3. Make prediction(Kubernetes): `./make_prediction_k8s.sh`

### Scale up and scale down the deployment:

* Scale up to 6 replicas: `kubectl scale deployment prediction --replicas=6`
* Scale down to 3 replicas: `kubectl scale deployment prediction --replicas=3`
* Video file `scale-up-down.flv` shows the scale up and scale down characteristics of the kubernetes application.

### Delete or stop minikube cluster

* `minikube delete`
* `minikube stop`

### File description

* Dockerfile - instructions for building Docker image
* Makefile - File that organize the code compilation
* app.py - File with the application logic 
* make_prediction.sh - File for making a prediction for application running in Docker
* make_prediction_k8s.sh - File for making a prediction for application running in Minikube Kubernetes cluster
*	prediction-deployment.yaml - Run the application as a Kubernetes deployment
*	prediction-service.yaml - Expose the deployment running in Kubernetes
* requirements.txt - List of all of the Python packages that the prediction app depends on
* run_docker.sh - This script builds a container from Dockerfiles, lists images and runs the app in Docker
* run_kubernetes.sh - This script runs a Pod with an image from Dockerhub repo and forwards the container port to the host
*	scale-up-down.flv - Demo video showing Kubernetes scale up/down capabilities
* upload_docker.sh - This file tags and uploads an image to Docker Hub
