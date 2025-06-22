Steps to check the project

Step 1 : Login to cloudshell of the account. 

run following commands to ensure terraform is installed on cloudshell
```
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

mkdir ~/bin

ln -s ~/.tfenv/bin/* ~/bin/

tfenv install

tfenv use 1.4.4

terraform --version

```

Step 2 : clone the Repo
```
git clone https://github.com/ShreyasRavath/AER-DevOpsPipeline
```

Step 3: Create Jenkins Server
```
cd AER-DevOpsPipeline/jenkins-server-terraform/
terraform init
aws ec2 describe-key-pairs --key-names devsecops-project >/dev/null 2>&1 && aws ec2 delete-key-pair --key-name devsecops-project && rm -f devsecops-project.pem; aws ec2 create-key-pair --key-name devsecops-project --query "KeyMaterial" --output text > devsecops-project.pem && chmod 400 devsecops-project.pem
terraform apply --auto-approve
```


Step 4 : Connect to Jenkins Server
Copy the follwoing code to get the initial password string and change the password 

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Access the Jenkins server using the <public IP> :8080 and use the copied password --> Install suggested plugins 
Once done create first admin user --> Save an finish

Step 5: Login with the new user created and go to Manage Jenkins and install following available plugins
```
AWS Credentials
AWS Steps
Docker plugins
Eclipse Temurin installer
NodeJS
OWASP Dependency-Check,
SonarQube Scanner.
```

Step 6: Configure the sonar qube server
#note: since we are keeping the system in stopped state. We need to start the sonarqube container before accessing. run "docker start sonar" on Jenkins Server
Access the Sonarqube server using the <public IP> :9090
Create two projects one for frontend and one for backend (Copy the token of projects to use during pipeline)
Create a webhook mentioning the jenkins url with URI 

Step 7: Create ECR repositories, execute following commands in cloudshell to create repos
```
aws ecr create-repository --repository-name front-end
aws ecr create-repository --repository-name front-end
```
Get any of the push commands and execute it on jenkins server to ensure ecr is accessible. 

Step 8: Configure Jenkins








