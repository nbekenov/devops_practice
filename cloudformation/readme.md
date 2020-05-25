# create stack
aws cloudformation create-stack --stack-name example --template-body file://templates/single_instance.yml --parameters file://parameters/single_instance.json

# update stack
aws --profile nurAutomation cloudformation update-stack --stack-name example --template-body file://ec2_simple_example.yaml

# delete stack
aws --profile nurAutomation cloudformation delete-stack --stack-name example

# create change set aka dry run
## for not existing stack need to add --change-set-type CREATE
aws --profile nurAutomation cloudformation create-change-set --change-set-name changeset-1 --change-set-type CREATE --stack-name example --t
emplate-body file://ec2_simple_example.yaml --change-set-name changeset-1
## describe changes that will be applied
aws --profile nurAutomation cloudformation describe-change-set --change-set-name changeset-1 --stack-name example

Testing
https://workshop.quickstart.awspartner.com/70_testing/1_local_test.html