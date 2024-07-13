module "vpc" {
  source = "./vpc"
}

module "bastion" {
  source = "./bastion"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet1_id
}

module "nat_gateway" {
  source = "./nat-gateway"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet2_id
}

module "load_balancers" {
  source = "./load-balancers"
  vpc_id = module.vpc.vpc_id
  public_subnet1_id = module.vpc.public_subnet1_id
  public_subnet2_id = module.vpc.public_subnet2_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
}

module "autoscaling_groups" {
  source = "./autoscaling-groups"
  vpc_id = module.vpc.vpc_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
}

module "ec2_instances" {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
}

module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
}

module "devops_tools" {
  source = "./devops-tools"
  public_subnet1_id = module.vpc.public_subnet1_id
  public_subnet2_id = module.vpc.public_subnet2_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
}

module "route53" {
  source = "./route53"
}
