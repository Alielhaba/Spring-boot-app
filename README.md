# spring-boot
Building a CI/CD pipeline With Azure Cloud and Github repository, Then deploy the app in EKS Cluster .

####
# Overview
####
This project shows how to build a Continuous Integration (CI) and Continuous Delivery (CD) pipeline with Azure Devops and GitHub repository from scratch. Few actions to perform include:
  * Setting up a Github repo with dev branch.
  * Create Docker file to build our app .
  * Create EKS Cluster and Manager instance to manage the cluster Using Terraform.
  * perform lint, test, build , dpeloy stages using pipeline.
  * Azure Pipeline integration to the project to enable CI/CD .
    
    
# Architectural Workflow Diagram
#### 


# Create Docker file to build our app and Test it .
### Build Docker Image
```
docker build -t spring-boot .
```
![Screenshot from 2023-11-16 22-26-03](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/a1c66b7f-e0f5-4963-ad9a-fb87096b57e1)

### Run The Container To Test The Image 
```
docker run -d -p 8080:8080 spring-boot
```
![Screenshot from 2023-11-16 22-28-18](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/ab00e326-9ff0-4d77-b8a8-504d9c20fdc2)

# Create EKS Cluster and Manager instance to manage the cluster Using Terraform.
## Steps to create Our Infrastructure .
### 1 - Clone This Repo  .
### 2- Then open terminal in the project path and run : 
       - terraform init
       - terraform plan
       - terraform apply

------------------------------------------------------------------------------------------------------------------------------------------

```
terraform init
```
![Screenshot from 2023-11-23 13-02-39](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/8205da77-5870-41ca-b041-311eed5f2a03)


------------------------------------------------------------------------------------------------------------------------------------------
```
terraform plan
```
![Screenshot from 2023-11-23 14-57-49](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/8c38607e-a767-46b7-82a8-e4bf32529c91)

------------------------------------------------------------------------------------------------------------------------------------------

```
terraform apply
```
![Screenshot from 2023-11-23 15-17-59](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/947404bf-8e75-4d7d-ae7a-c7b346d5ff21)

![Screenshot from 2023-11-23 15-18-36](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/6a428d92-479f-4728-af33-f9e8581ca0b0)

## Managment instance With Cluster nodes 

![Screenshot from 2023-11-23 16-36-49](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/f24aee12-3836-4974-935c-da6cd5d32d9d)

## The EKS Cluster 

![Screenshot from 2023-11-23 16-38-12](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/5c66cb6b-61ac-4f17-972d-20542d246343)

## Roles 

![Screenshot from 2023-11-23 16-38-40](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/3b007c81-8ed9-49a4-a154-8f41bc90e4eb)

------------------------------------------------------------------------------------------------------------------------------------------------------
## To Create Ingress for the app.
# first Connect to the Management instance 
# Second Connect to EKS Cluster 
# Third Install the NGINX Ingress controller


## Connect to the Management instance

```
ssh -i "ec2_key.pem" ubuntu@ ( Instance Public IP )
```

## Second Connect to EKS Cluster

```
aws eks update-kubeconfig --region us-east-1 --name Spring-boot-cluster
```

![Screenshot from 2023-11-23 19-04-58](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/0c379a52-db7c-4abe-9027-f99ce703cc8b)


## Install the NGINX Ingress controller

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml
```

![Screenshot from 2023-11-23 19-04-22](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/05956be9-2da3-4402-84f2-9e54e4d653ce)



### Azure Devopse Pipeline setup 

















        

