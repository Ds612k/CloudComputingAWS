module "vpc" {
 source = "./modules/vpc"
}

module "ec2" {
 source = "./modules/ec2"
 vpc_id       = module.vpc.vpc_id
 private_subnet_id = module.vpc.private_subnet_id
}

module "s3" {
 source = "./modules/s3"
}

module "dynamodb" {
 source = "./modules/dynamodb"
}