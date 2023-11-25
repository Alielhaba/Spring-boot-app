# $${\color{blue} spring-boot Project }$$

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

![sprint-boot drawio](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/10d1a6a3-16e7-4237-a3d6-10f5389d1993)



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
### first Connect to the Management instance 
### Second Connect to EKS Cluster 
### Third Install the NGINX Ingress controller


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



# Azure Devopse Pipeline setup 

1- Create Azure Devops Account 
2- Create New Organization
3- Create New Project
4- Create Pipeline 
6- Create Self Host Agent 


## Create New Organization

![Screenshot from 2023-11-25 14-09-35](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/601ec74c-b348-4580-a8a6-1ef42c452b08)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Create New Project
![Screenshot from 2023-11-25 14-10-32](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/8ce198e5-2361-49a0-bb26-81f5da7a75cf)

![Screenshot from 2023-11-25 14-10-45](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/0f1ef8c0-fe80-4097-8d69-0a5c6cc9c954)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Create Pipeline

- Click Pipelines

  ![Screenshot from 2023-11-25 14-14-12](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/4e7d2055-cfe9-4c91-9ea2-933249c5eda3)

- Click Create Pipeline

  ![Screenshot from 2023-11-25 14-15-04](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/b1134240-9931-4cc6-8c7e-10ba5fb91137)

- Choose Code Repository

  ![Screenshot from 2023-11-25 14-15-55](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/a333ac23-f269-4376-b632-6100a44ab4e8)

- Write The Script

  ![Screenshot from 2023-11-25 14-17-49](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/f230f0a4-7218-495e-a989-0d1e270dcc45)

- Create Pipeline variables

  ![Screenshot from 2023-11-25 14-18-57](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/03d9e7d3-bfed-4dcc-9555-6b6a280e9938)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Create Self Host Agent 

- Create EC2 Instance and ssh to it to be pipeline host
  ![Screenshot from 2023-11-25 14-24-05](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/82176ff6-afe4-4b1c-aa64-edca4cb7a7cf)

  ![Screenshot from 2023-11-23 19-58-11](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/f1601c4e-e083-4195-a965-562cdd372c04)

- Open Project Setting .
- Agent pools .
- Add Pool .
- Select “Self-hosted”, give a name and create it.
- Navigate into the new Agent Pool and click “New agent” .
- Select “Linux” and copy the “Download the agent” link the follow the steps.
- Create PAT (Personal Access Token) in order to be able to authenticate the VM.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
![Screenshot from 2023-11-23 20-09-08](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/48359bac-fa5e-4f3d-9d50-ad18e153a174)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
```
curl https://vstsagentpackage.azureedge.net/agent/3.230.0/vsts-agent-linux-x64-3.230.0.tar.gz --output vsts-agent-linux.tar.gz
```
```
mkdir self-host
cd self-host
```
```
tar zxvf ~/Downloads/vsts-agent-linux-x64-3.230.0.tar.gz
```

![Screenshot from 2023-11-23 19-58-29](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/9b8c062d-d7ce-4d21-8ce4-eccdc1238e5f)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

```
./config.sh
```
![Screenshot from 2023-11-23 19-59-11](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/b5674f12-206e-4a02-8e3e-a1ae63319c92)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Create PAT (Personal Access Token) in order to be able to authenticate the VM.
 - Azure DevOps portal, click on the “User settings”
 - Select “Personal Access Token”
 - Create a new token with the “Agent Pool — Read & Manage” permission.
 - Copy the value of the token and use it in the next step .

![Screenshot from 2023-11-25 14-40-20](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/661e1931-a4a5-4b2d-8f4d-bef8935a22cd)

![Screenshot from 2023-11-23 19-59-29](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/63193acb-22d9-407f-a9c0-67ca01d49869)

# Now the agent is created but it is offline .

![Screenshot from 2023-11-23 20-00-44](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/374a4f3b-79b7-4c18-a356-ec3a0e7e336f)

# To run the agent .

```
./run.sh
```
![Screenshot from 2023-11-23 20-01-01](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/53bb99fd-fdfa-4577-9937-c20ac6c48b2f)


## Now the agent is online .

![Screenshot from 2023-11-23 20-01-40](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/f4047456-7313-438f-8097-c4793f97f1d7)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Pipeline Result 

![Screenshot from 2023-11-25 17-12-39](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/254a5426-9b9e-44da-bc85-db1c89558ec2)

# Kubernates Deployments 

## Dev Enviornment 

![Screenshot from 2023-11-25 17-51-11](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/503473cb-e9c0-447d-b546-9e27ee5edd89)

## Prod Enviornment 

![Screenshot from 2023-11-25 18-35-28](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/a8a192fd-05f0-4aac-acd0-87adfc67ffa7)



# $${\color{blue} Thanks }$$


 









        

