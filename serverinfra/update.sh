aws cloudformation update-stack --stack-name server-infra --template-body file://$2  --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region us-east-1
