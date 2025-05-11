# Production AWS Region
provider "aws" {
  region = "us-east-1"
  alias  = "prod"
}

# Disaster Recovery AWS Region
provider "aws" {
  region = "eu-west-1"
  alias  = "dr"
}