resource "aws_instance" "dev" {
  ami="ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  key_name = "windows-demo"
  user_data = file("test.sh") #calling the test.sh where installtion to be done 
}
