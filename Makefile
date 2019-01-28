S3="sam-bucket-sw"
STACK_NAME="sam-app"
all: deploy
pkg:
	sam package --template-file template.yaml --output-template-file package.yaml --s3-bucket ${S3} 

deploy:
	sam deploy --template-file package.yaml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM

del:
	aws cloudformation delete-stack --stack-name ${STACK_NAME} 

ls:
	aws cloudformation describe-stacks --stack-name ${STACK_NAME}