
# Configure the AWS Provider
provider "aws" {
  alias   = "requester"
  region  = var.region
  profile = "pricespider-tf-custom-user-role"
  assume_role {
    role_arn     = "arn:aws:iam::830290859682:role/tf_assumed_role"
    session_name = "TERRAFORM_SESSION"
  }
}

provider "aws" {
  alias   = "accepter"
  region  = "us-east-1"
  profile = "pricespider-tf-custom-user-role"
  # Accepter's credentials.
  assume_role {
    role_arn     = var.target_peer_vpc_role_arn
    session_name = "TERRAFORM_SESSION"
  }
}


# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  provider      = aws.requester
  vpc_id        = var.sql_server_main_vpc_id
  peer_vpc_id   = var.target_peer_vpc_id
  peer_owner_id = var.target_peer_vpc_owner_id
  peer_region   = var.target_peer_vpc_region
  auto_accept   = false
  tags = {
    Side      = "Requester"
    Managedby = "Terraform"
    Name      = "sql_account_vpc_peering_${var.target_peer_vpc_owner_id}_${var.target_peer_vpc_id}"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
  tags = {
    Side = "Accepter"
  }
}

resource "aws_vpc_peering_connection_options" "requester" {
  provider = aws.requester
  # As options can't be set until the connection has been accepted
  # create an explicit dependency on the accepter.
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}
