variable "prod_ami_id" {
  type        = string
  description = "AMI ID for the production EC2 instance"
  default = "ami-085ad6ae776d8f09c" # Amazon Linux 2023 us-east-1
}

variable "dr_ami_id" {
  type        = string
  description = "AMI ID for the DR EC2 instance"
  default = "ami-04e7764922e1e3a57" # Amazon Linux 2023 eu-west-1
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 instances SSH key pair"
  default     = "test-sre"
}

variable "domain_name" {
  type        = string
  description = "(ex: example.com)"
  default     = "ricardoboriba.net"
}

variable "subdomain" {
  type        = string
  description = "Subdomain used by the web application"
  default     = "test"
}

variable "dr_switchover" {
  type        = bool
  description = "Flag that controls environment switchover (false = Production | true = Disaster Recovery)"
  default     = false
}