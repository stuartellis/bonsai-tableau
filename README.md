# Bonsai Tableau

Tool kit for building and running Tableau containers.

To deploy the builder VM:

        aws cloudformation deploy --capabilities CAPABILITY_NAMED_IAM --template-file $PWD/builder/cfn/ec2-builder-vm-template.yml --parameter-overrides file://$PWD/builder/cfn/ec2-builder-vm-params.json --stack-name sje-builder-vm
