# Jenkins 
![image](https://user-images.githubusercontent.com/110176257/187971896-edefbac2-84e4-43b8-a51f-4c5668386e23.png)

## What is jenkins?
Jenkins is an open source automation software which enables us to automatically test, and deploy our software with no manual hassle. It acts as the server for our CICD chain of actions
---
## Why is Jenkins important and why do we use it?
Jenkins is **open source**, this means it is free to use and the code is available for anyone to edit. This means the community can contribute to developing new functionality within the software which results in there being over a thousand different **plugins** which can be installed to enhance its capability. One of the biggest benefits of Jenkins is easy environment configuration and user-friendly interface.



## Generate a Public/Private key pair
- Generate a new ssh key with this command `ssh-keygen -t rsa -b 4096 -C "the_email_address_you_signed_up_to_github_with"` If you are using a legacy system that doesn't support the Ed25519 algorithm, use:`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
- Next navigate to ~/.ssh directory
- Display the public key using cat or nano command and copy the key contents
- On the GitHub repository, go on Settings
- Click on Deploy keys > Add deploy key
- Enter a title and paste the key
- Check Allow write access and click Add key
## Create a Webhook
- On your online repository, click on Setting
- Click on Webhooks > Add webhook
- Enter the Payload URL as http://jenkins_ip:8080/github-webhook/
- For the Content type, select apllication/json
- For the events to trigger, select Send me everything
- Check Active and click Add webhook
## Creating Jenkins Jobs
- On the Jenkins Dashboard, click on New Item
- Enter a the name in convetion for the job
- Select Freestyle project
- Click Ok
- Create a job for CI, merging and deployment
## Continuous Integration (CI) Job
- Click Discard old builds and keep the max number of build to 3
- Click GitHub project and add the HTTP URL of the repository
Office 365 Connector:
- Click Restrict where this project can be run, then set it as sparta-ubuntu-node
Source Code Management:
- Select Git
In Repositories:
- Repository URL: insert the SSH URL from GitHub
Credentials:
- Next to Credentials, click Add > Jenkins
- Select Kind as SSH Username with private key
- Set a suitable description and enter the private key directly. The private key is in your ~/.ssh directory. Ensure that the begin and end text of the key is included.
- With the credential added, select the one you created
- Branches to build: set to */dev (dev branch)
Build Triggers:
- Click GitHub hook trigger for GITScm polling
Build Environment:
- Click Provide Node & npm bin/ folder to PATH
- Click Add build step > Execute Shell
- In command, enter the following code:
```cd app
npm install
npm test
```
Post-build Actions:
- Select Add post-build action > Build other projects
- Insert the project name for the merge job
Ensure Trigger only if build is stable is selected
### Merge Job
- Click Discard old builds and keep the max number of build to 
- Click GitHub project and add the HTTP URL of the repository
Office 365 Connector:
- Click Restrict where this project can be run, then set it as sparta-ubuntu-node
Source Code Management:
- Select Git
In Repositories:
- Repository URL: insert the SSH URL
- Credentials: select the credential you created earlier
- Branches to build: set to */dev (dev branch)
Build Environment:
- Select Provide Node & npm bin/ folder to PATH
Post-build Actions:
- First, select Add post-build action > Git Publisher
- Click Push Only If Build Succeeds
In Branches:
- Branch to push: main
- Target remote name: origin
- Next, select Add post-build action > Build other projects
- Insert the project name for the deploy job
- Ensure Trigger only if build is stable is selected
- Ensure the Build other projects block is below the Git Publisher block
