resource "aws_instance" "dev" {
   ami="ami-0bb84b8ffd87024d8"
   instance_type = "t2.micro"
    key_name = "windows-demo"
   tags = {
     Name="radhe"
   }
}
resource "aws_ebs_volume" "dev" {
    availability_zone = "us-east-1a"
   size = 1
    depends_on = [ aws_instance.dev ]
}
