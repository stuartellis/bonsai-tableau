# Bonsai Tableau

Tool kit for building and running Tableau using [Tableau Server in a Container](https://help.tableau.com/current/server-linux/en-us/server-in-container_setup-tool.htm).

## Deploy VM for Containers

To deploy the builder VM:

        aws cloudformation deploy --capabilities CAPABILITY_NAMED_IAM --template-file $PWD/builder/cfn/ec2-builder-vm-template.yml --parameter-overrides file://$PWD/builder/cfn/ec2-builder-vm-params.json --stack-name sje-builder-vm

## Run the Tableau Container

    TABSRV_LICENSE_KEY=<KEY>
    docker run -e LICENSE_KEY=$TABSRV_LICENSE_KEY -p 8080:8080 -d tableau_server_image:20221.22.0616.1738
