# Disaster Recovery EC2 Instance
resource "aws_instance" "dr_webserver" {
  provider               = aws.dr
  ami                    = var.dr_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.dr_sg.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Hello World from Disaster Recovery!</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF
  tags = {
    Name        = "dr-instance"
    Environment = "Disaster Recovery"
  }
  depends_on = [aws_security_group.dr_sg]
}