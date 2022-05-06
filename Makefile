.PHONY: build
.ONESHELL:

build:
	@ $(if $(AWS_PROFILE),$(cal assume_role))
	packer build packer.json
# Dynamically assume role and injects credentials into enviornment
define assume_role
	echo "setting up everything"
	export AWS_DEFAULT_REGION=$$(aws configure get region)
	eval $(eval "aws sts assume-role --role-arn arn:aws:iam::0123456789:role/the-role-name --role-session-name my-aws-prod | ./sts2env")
	echo $AWS_SESSION_TOKEN
endef
