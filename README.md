Steps to check the project

Step 1 : Login to Terraform Executor Instance Login to console --> ec2 --> search for instance i-0559e268aa27aee3f --> connect

Check Terraform, Docker, kubectl, eksctl, and Git Installation 
```
terraform -help 
docker --version 
kubectl version --client 
eksctl version 
git --version
```

Step 2 : clone the Repo
```
git clone https://github.com/ShreyasRavath/AER-DevOpsPipeline
```

Step 3: Create Jenkins Server
```
cd AER-DevOpsPipeline/jenkins-server-terraform/
terraform init

aws ec2 create-key-pair --key-name devsecops-project --query "KeyMaterial" --output text > devsecops-project.pem





terraform apply 

