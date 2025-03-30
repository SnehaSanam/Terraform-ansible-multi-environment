# dev-infra
module "dev-infra" {
  source          = "./Infra"
  env             = "dev"
  instance_count  = 2
  instance_type   = "t2.micro"
  ami             = "ami-0df368112825f8d8f"
  volume_size     = 10
}

# stg-infra
module "stg-infra" {
  source          = "./Infra"
  env             = "stg"
  instance_count  = 2
  instance_type   = "t2.small"
  ami             = "ami-0df368112825f8d8f"
  volume_size     = 10
}

# prd-infra
module "prd-infra" {
  source          = "./Infra"
  env             = "prd"
  instance_count  = 3
  instance_type   = "t2.micro"
  ami             = "ami-0df368112825f8d8f"
  volume_size     = 10
}

# Output the public IPs for each environment
output "dev_infra_ec2_public_ips" {
  value = module.dev-infra.ec2_public_ips
}

output "stg_infra_ec2_public_ips" {
  value = module.stg-infra.ec2_public_ips
}

output "prd_infra_ec2_public_ips" {
  value = module.prd-infra.ec2_public_ips
}
