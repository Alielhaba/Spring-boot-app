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



```
terraform init
```
![Screenshot from 2023-11-19 16-55-23](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/5d39e168-1574-468a-92ae-d5bd84477e57)


```
terraform plan
```

```
terraform apply
```
















        

