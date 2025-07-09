
## Create a VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/22
aws ec2 describe-vpcs

## Create IGW (Internet gateway)
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --internet-gateway-id igw-4545215445 --vpc-id vpc-65546413119654 
aws ec2 describe-internet-gateways

## Create subnets
aws ec2 create-subnet --cidr-block 10.0.0.0/25 --vpc-id vpc-65546413119654

## Create route table, add a route and attach the route table to the subnet
aws ec2 create-route-table --vpc-id vpc-65546413119654
aws ec2 create-route --destination-cidr-block 0.0.0.0/0  --gateway-id igw-4545215445 --route-table-id rtb-632165945
aws ec2 associate-route-table --route-table-id rtb-632165945 --subnet-id subnet-56324961
