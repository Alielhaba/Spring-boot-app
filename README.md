# spring-boot-bank-misr
Building a CI/CD pipeline With Azure Cloud and Github repository, Then deploy the app in EKS Cluster .

####
# Overview
####
This project shows how to build a Continuous Integration (CI) and Continuous Delivery (CD) pipeline with Azure Devops and GitHub repository from scratch. Few actions to perform include:
  * Setting up a Github repo with dev branch.
  * Create Docker file to build our app .
  * Create EKS Cluster in Private subnet .
  * Connect to the EKS Cluster using vm .
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



    
