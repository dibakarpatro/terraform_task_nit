
data "aws_subnet" "selected" {
    filter {
      name="tag:Name"
      values = ["example"]
    }
}


resource "aws_instance" "dev2" {
    ami ="ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "windows-demo"
    tags = {
      Name="hi"
    }
    subnet_id = data.aws_subnet.selected.id
  
}
