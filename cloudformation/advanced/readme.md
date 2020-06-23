this is advanced

cfn_nag_scan --input-path cfn_params_example.yaml

aws cloudformation validate-template \
    --template-body file://cfn_params_example.yaml 