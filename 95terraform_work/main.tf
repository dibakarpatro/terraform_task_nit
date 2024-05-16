resource "aws_instance" "ec2"{
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags ={
        Name = "Radhikesh"
    }
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "gyu8g8g6f6f6fff"
}