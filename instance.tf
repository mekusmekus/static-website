// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


# Configure the EC2 instance in a public subnet
resource "aws_instance" "ec2-private-1" {
  ami                         = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private-subnet-1.id

  tags = {
    "Name" = "private-instance-1}"
  }
}

# Configure the EC2 instance in a public subnet
resource "aws_instance" "ec2_private-2" {
  ami                         = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = false
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private-subnet-2.id

  tags = {
    "Name" = "private-instance-2}"
  }
}

resource "aws_key_pair" "mykey" {

    key_name = "mykeypair"
    public_key = file(var.PATH_TO_PUBLIC_KEY) 
}


# Configure the EC2 instance in a public subnet
resource "aws_instance" "ec2_public" {
  ami                         = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.public-sub-sg.id, aws_security_group.http-access.id]
  key_name = aws_key_pair.mykey.key_name
  user_data = <<EOF
    #! /bin/bash
                sudo yum update -y
    sudo yum install -y httpd.x86_64
    sudo service httpd start
    sudo service httpd enable
    echo "<h1>My first static website hosting" | sudo tee /var/www/html/index.html
  EOF

  tags = {
    "Name" = "public-instance"
  }

  
   connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
}
}

output "public_ip" {

    value = aws_instance.ec2_public.public_ip
  
}





