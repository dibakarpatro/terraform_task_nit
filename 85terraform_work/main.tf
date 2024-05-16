#create cust vpc
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cust_dev"
    }
}
#create cust subnet
resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name ="cust_subnet"
    }
}
#create IG & attach to vpc 
resource "aws_internet_gateway" "dev" {
    vpc_id =aws_vpc.dev.id
}
#create RT & configure IG (edit routes)
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    } 
}
#subnet association to add into RT
resource "aws_route_table_association" "dev" {
    subnet_id =aws_subnet.dev.id
    route_table_id = aws_route_table.dev.id
}
#create sg 
resource "aws_security_group" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name ="cust_sg"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
#craete ec2 instance 
resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type= var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.dev.id 
    security_groups = [aws_security_group.dev.id]
    tags = {
      Name ="ec2"
    }
}
