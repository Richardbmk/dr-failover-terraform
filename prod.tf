# Production EC2 Instance
resource "aws_instance" "prod_webserver" {
  provider               = aws.prod
  ami                    = var.prod_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.prod_sg.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Hello World from Production!</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF
  tags = {
    Name        = "prod-instance"
    Environment = "Production"
  }
  depends_on = [aws_security_group.prod_sg]
}