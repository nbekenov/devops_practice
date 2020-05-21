# create stack
aws cloudformation create-stack --stack-name example --template-body file://templates/single_instance.yml --parameters file://parameters/single_instance.json

# update stack
aws --profile nurAutomation cloudformation update-stack --stack-name example --template-body file://ec2_simple_example.yaml

# delete stack
aws --profile nurAutomation cloudformation delete-stack --stack-name example

Testing
https://workshop.quickstart.awspartner.com/70_testing/1_local_test.html