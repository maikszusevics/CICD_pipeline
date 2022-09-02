# CICD_pipeline

The CI/CD pipeline is essentially automation: pushing code changes, automated testing, and automated deployment to the next level of development/release.

![image](https://user-images.githubusercontent.com/110176257/187883095-68ed4c52-f177-48cf-be78-6b31400f2eca.png)
##### Node: A machine which is part of the Jenkins environment and capable of executing Pipelines or jobs. Both the Controller and Agents are considered to be Nodes.
##### Master: The central, coordinating process which stores configuration, loads plugins, and renders the various user interfaces for Jenkins.
##### Agnet: is typically a machine, or container, which connects to a Jenkins controller and executes tasks when directed by the controller.

- Localhost changes --> push to github --> CICD pipeline automates tests --> tests pass --> deployed

#### CICD is considered as the backbone of DevOps
---
### CI (Continuous Integration)
Continuous integration is the practice of automating the integration of code changes from multiple contributors into a single software project. It’s a primary DevOps best practice, allowing developers to frequently merge code changes into a central repository where builds and tests then run. Automated testing tools are used to make sure the code works before before integration.

Without CI, developers would need to manually coordinate when they are contributing code to the end product.


![image](https://user-images.githubusercontent.com/110176257/187884688-55665649-7c50-4582-bf46-b04d36f08735.png)


### Continuous Delivery
Continuous delivery is an extension of CI which aims to deliver these integrated changes to the customers in an agile and sustainable way. Using **continuous delivery**, the release process is automated just like the CI automated testing process. All of this automation means you can have your development changes ready to be deployed at the click of a button.

### Continuous Deployment
This goes a step further than continuous delivery; every development change that passes integration tests will be released to customers. There is no manual deploy button to click unlike with only continuous delivery.

![image](https://user-images.githubusercontent.com/110176257/187890739-3887589c-7bd4-44e1-ac6c-3d3ba2d2cab7.png)



## Goal:

#### Create jobs in jenkins which will automate the process of copying repo code to an EC2 instance and provisioning all dependencies including DB_HOST variable, and then starting the app itself.



Steps:

- Create ec2
- create security group
- allow jenkins ip to ssh in 
- allow any rules required 
- create 3rd job in jenkins 
- get code from main branch 
- copy (scp) to new ec2
- run script to install dependencies 
- the 3rd job must only be triggered if the second job was successful
- first iteration run npm install and npm start manually 
- 4th job launch the app, launched if 3rd was success
- pm2 kill all - Create 5th job to create db host variable
- npm start


