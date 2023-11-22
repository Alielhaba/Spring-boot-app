# spring-boot
Building a CI/CD pipeline With Azure Cloud and Github repository, Then deploy the app in EKS Cluster .

####
# Overview
####
This project shows how to build a Continuous Integration (CI) and Continuous Delivery (CD) pipeline with Azure Devops and GitHub repository from scratch. Few actions to perform include:
  * Setting up a Github repo with dev branch.
  * Create Docker file to build our app .
  * Create EKS Cluster and Manager instance to manage the cluster.
  * perform lint, test, build , dpeloy stages using pipeline.
  * Azure Pipeline integration to the project to enable CI/CD .
    
    
# Architectural Workflow Diagram
#### 


# Create Docker file to build our app and Test it .
### Build Docker Image
```
docker build -t spring-boot .
```
![Screenshot from 2023-11-16 22-26-03](https://github.com/Alielhaba/spring-boot-bank-misr/assets/118537759/409a578c-661f-4eae-a01b-b2d9451357d8)

### Run The Container To Test The Image 
```
docker run -d -p 8080:8080 spring-boot
```
![Screenshot from 2023-11-16 22-28-18](https://github.com/Alielhaba/spring-boot-bank-misr/assets/118537759/737b18fd-88c3-48c4-adae-d5ab00cbb79d)

# Create EKS Cluster and Manager instance to manage the cluster .
## Steps to create EKS Cluster 
### 1 - Create VPC With Private and Public subnets .
###     Public Subnets for Managment instance . 
###     Private Subnets for EKS Cluster .


![Screenshot from 2023-11-19 16-55-23](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/5d39e168-1574-468a-92ae-d5bd84477e57)

### 2 - Create EC2 Instance in public subnets.

![Screenshot from 2023-11-19 16-58-51](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/d7925e75-0c70-4d0b-bd2a-850c2c560356)

### EC2 Security Group Allow oly SSH

![Screenshot from 2023-11-19 17-11-28](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/856c4c86-9406-47ab-a046-ae76619220f5)



### 3 - Create EKS Cluster in private subnets.
        before starting to create the EKS Cluster you should create : 
      * role for the cluster and add ( AmazonEKSClusterPolicy ) .
      * role for the node group and add (  AmazonEKSWorkerNodePolicy , AmazonEC2ConainerRegistryReadOnly ) .
      * security group for the cluster to enable incoming traffic from the EC2 . 

### Cluster Role 

![Screenshot from 2023-11-19 17-13-50](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/83a57767-fafa-44be-acde-5532009cf405)

### Node Group Role 

![Screenshot from 2023-11-19 17-14-28](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/d9cf7e4d-3030-46a8-9ff1-cf465306ebf1)

### Cluster Security Group 

![Screenshot from 2023-11-19 17-15-38](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/2cf124ac-5d6e-4897-b590-4fa06d13d0f5)


## Then Start to create Your Cluster 

### EKS Cluster 

![Screenshot from 2023-11-19 17-17-53](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/a0d86f22-d420-4a8e-93d4-e52245a4493b)

### Craete Node Group 

![Screenshot from 2023-11-19 17-18-55](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/4aa5ec52-54ed-4daa-b0f3-d22b739c2d64)

![Screenshot from 2023-11-19 17-19-33](https://github.com/Alielhaba/Spring-boot-app/assets/118537759/63780db3-3702-474f-9244-8fc4c3d8656e)














        

