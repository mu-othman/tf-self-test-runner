terraform {
  required_version = ">= 0.12.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "pricespider-aws-terraform-sqlserver-production-account"
    key     = "infra/terraform/vpc/terraform.state"
    region  = "us-west-2"
    encrypt = true
    profile = "pricespider-tf-custom-user-role"
  }
}
######################### Insights VPC Peering Connections #########################
module "vpc_peering_insights_vpc_fd6b7f87" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.31.0.0/16"
  target_peer_vpc_id       = "vpc-fd6b7f87"
  target_peer_vpc_owner_id = "505611382770"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::505611382770:role/tf_assumed_role"
}
module "vpc_peering_insights_vpc_08408812025602ff7" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "10.209.0.0/16"
  target_peer_vpc_id       = "vpc-08408812025602ff7"
  target_peer_vpc_owner_id = "505611382770"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::505611382770:role/tf_assumed_role"
}

######################### Crawler5 VPC Peering Connections ############################
module "vpc_peering_crawl_vpc_0c7e689ee88dc53d2" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.35.0.0/16"
  target_peer_vpc_id       = "vpc-0c7e689ee88dc53d2"
  target_peer_vpc_owner_id = "489370666913"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::489370666913:role/tf_assumed_role"
}
module "vpc_peering_crawl_vpc4729a522" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.30.0.0/16"
  target_peer_vpc_id       = "vpc-4729a522"
  target_peer_vpc_owner_id = "489370666913"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::489370666913:role/tf_assumed_role"
}
module "vpc_peering_crawl_vpc_08063239275bf7489" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.16.0.0/16"
  target_peer_vpc_id       = "vpc-08063239275bf7489"
  target_peer_vpc_owner_id = "489370666913"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::489370666913:role/tf_assumed_role"
}

######################### Prowl VPC Peering Connections ############################
module "vpc_peering_prowl_vpc_0612b6d675a722cbd" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "10.0.0.0/16"
  target_peer_vpc_id       = "vpc-0612b6d675a722cbd"
  target_peer_vpc_owner_id = "350946371189"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::350946371189:role/tf_assumed_role"
}
module "vpc_peering_prowl_vpc_0670b761a47ebe57b" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.32.0.0/16"
  target_peer_vpc_id       = "vpc-0670b761a47ebe57b"
  target_peer_vpc_owner_id = "350946371189"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::350946371189:role/tf_assumed_role"
}
module "vpc_peering_prowl_vpc_c416fabe" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.16.0.0/16"
  target_peer_vpc_id       = "vpc-c416fabe"
  target_peer_vpc_owner_id = "350946371189"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::350946371189:role/tf_assumed_role"
}
module "vpc_peering_prowl_vpc_d92e80bc" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.31.0.0/16"
  target_peer_vpc_id       = "vpc-d92e80bc"
  target_peer_vpc_owner_id = "350946371189"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::350946371189:role/tf_assumed_role"
}
module "vpc_peering_prowl_vpc_ec413197" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.32.100.0/24"
  target_peer_vpc_id       = "vpc-ec413197"
  target_peer_vpc_owner_id = "350946371189"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::350946371189:role/tf_assumed_role"
}

######################### PS-CCE VPC Peering Connections ############################
module "vpc_peering_pscce_vpc_08d11f7d0e0bc0b7f" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.35.0.0/16"
  target_peer_vpc_id       = "vpc-08d11f7d0e0bc0b7f"
  target_peer_vpc_owner_id = "069137512552"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::069137512552:role/tf_assumed_role"
}
module "vpc_peering_pscce_vpc_068cb6e66bae4b877" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "10.208.0.0/17"
  target_peer_vpc_id       = "vpc-068cb6e66bae4b877"
  target_peer_vpc_owner_id = "069137512552"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::069137512552:role/tf_assumed_role"
}
module "vpc_peering_pscce_vpc_a5b46ed8" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.31.0.0/16"
  target_peer_vpc_id       = "vpc-a5b46ed8"
  target_peer_vpc_owner_id = "069137512552"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::069137512552:role/tf_assumed_role"
}

######################### PS-DA VPC Peering Connections ############################
module "vpc_peering_psda_vpc_0841721f7f5f2f5c2" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.31.0.0/16"
  target_peer_vpc_id       = "vpc-0841721f7f5f2f5c2"
  target_peer_vpc_owner_id = "636938388277"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::636938388277:role/tf_assumed_role"
}

######################### WTB App VPC Peering Connections ############################
module "vpc_peering_wtb_vpc_0ae00884f80fc2364" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "10.204.0.0/16"
  target_peer_vpc_id       = "vpc-0ae00884f80fc2364"
  target_peer_vpc_owner_id = "912784490605"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::912784490605:role/tf_assumed_role"
}
module "vpc_peering_wtb_vpc_e89e7595" {
  source                   = "./modules/network"
  target_peer_vpc_cidr     = "172.31.0.0/16"
  target_peer_vpc_id       = "vpc-e89e7595"
  target_peer_vpc_owner_id = "912784490605"
  target_peer_vpc_region   = "us-east-1"
  target_peer_vpc_role_arn = "arn:aws:iam::912784490605:role/tf_assumed_role"
}