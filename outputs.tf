output "production_public_ip" {
  value       = aws_instance.prod_webserver.public_ip
  description = "Public IP of the production EC2 instance"
  sensitive   = false
}

output "dr_public_ip" {
  value       = aws_instance.dr_webserver.public_ip
  description = "Public IP of the DR EC2 instance"
  sensitive   = false
}

output "dns_record" {
  value       = "${var.subdomain}.${var.domain_name}"
  description = "The DNS record for the application"
  sensitive   = false
}

output "current_active_environment" {
  value       = var.dr_switchover ? "Disaster Recovery" : "Production"
  description = "Indicates which environment is currently active"
}