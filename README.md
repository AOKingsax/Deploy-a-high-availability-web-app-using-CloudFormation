# Deploy-a-high-availability-web-app-using-CloudFormation

## **Scenario**

A company is creating an Instagram clone called Udagram.

Developers want to deploy a new application to the AWS infrastructure.

You have been tasked with provisioning the required infrastructure and deploying a dummy application, along with the necessary supporting software.

This needs to be automated so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.

## **Task**

- In this project, you'll first develop a diagram that you can present as part of your portfolio and as a visual aid to understand the CloudFormation script. Mine is seen in `Deployment-diagram.jpeg`
- You’ll deploy web servers for a highly available web app using CloudFormation.
- You will write the code that creates and deploys the infrastructure and application for an Instagram-like app from the ground up.
- You will begin with deploying the networking components, followed by servers, security roles and software.
- You’ll do it exactly as it’s done on the job - following best practices and scripting as much as possible.

## **Prerequisites**

- AWS account
- Code Editor
- AWS CLI already configured with an **IAM User** with programmatic access in your Code Editor

## **Project Requirement**

### Server Specs

- You'll need to create a Launch Configuration for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group.
- You'll need two vCPUs and at least 4GB of RAM. The Operating System to be used is Ubuntu 18. So, choose an Instance size and Machine Image (AMI) that best fits this spec.
- Be sure to allocate at least 10GB of disk space so that you don't run into issues.

### Security Groups and Roles

- Since you will be downloading the application archive from an **S3 Bucket**, you'll need to create an **IAM Role** that allows your instances to use the S3 Service.
- Udagram communicates on the default `HTTP Port: 80`, so your servers will need this inbound port open since you will use it with the **Load Balancer** and the **Load Balancer Health Check**. As for outbound, the servers will need unrestricted internet access to be able to download and update their software.
- The load balancer should allow all public traffic `(0.0.0.0/0)` on `port 80` inbound, which is the default `HTTP port`. Outbound, it will only be using `port 80` to reach the internal servers.
- The application needs to be deployed into private subnets with a **Load Balancer** located in a public subnet.
- One of the output exports of the **CloudFormation script** should be the public URL of the **LoadBalancer**.

**Last thing: Remember to delete your CloudFormation stack when you're done to avoid recurring charges!**

## **Steps**

- Create a folder using your command line  
  `mkdir cloudFormation`
- Enter into the directory  
  `cd cloudFormation`
- Clone this repository  
  `git clone https://github.com/AOKingsax/Deploy-a-high-availability-web-app-using-CloudFormation.git`
- Enter into the cloned directory and also into the networkinfra directory  
  `cd Deploy-a-high-availability-web-app-using-CloudFormation`  
  `cd networkinfra`
- Run the create.sh script to create the network infrastructure  
  `./create.sh`
- After running, you enter the serverinfra directory  
  `cd ../serverinfra`
- Run the create.sh script to create the server infrastructure  
  `./create.sh`
- Log into your AWS account and you will see the resources already been created. Copy the **load balancer URL** and paste in a browser to access the webpage.
- Go back to the directories and run the `delete.sh` script to delete all the resources and avoid charges
