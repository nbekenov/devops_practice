##Install java
> sudo yum install -y java-1.8.0-openjdk-devel

##Install Jenkins
> sudo yum install -y wget \
> sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo  \
> sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key \
> sudo yum install -y jenkins
##Enables and start
> sudo systemctl enable jenkins \
> sudo systemctl start jenkins